#!/bin/bash

# etcd backup script for Kubernetes
# 配置参数
BACKUP_DIR="/opt/etcd-backup"                      # 备份存储目录
BACKUP_RETENTION_DAYS=7                            # 备份保留天数
ETCDCTL_API=3                                      # 使用 v3 版本的 API
ENDPOINTS="https://127.0.0.1:2379"                 # etcd 端点
ETCD_CERT_DIR="/etc/kubernetes/pki/etcd"          # etcd 证书目录

# 证书文件路径
CACERT="${ETCD_CERT_DIR}/ca.crt"
CERT="${ETCD_CERT_DIR}/server.crt"
KEY="${ETCD_CERT_DIR}/server.key"

# 日志函数
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# 错误处理函数
handle_error() {
    log "ERROR: $1"
    exit 1
}

# 创建备份目录
create_backup_dir() {
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR" || handle_error "无法创建备份目录"
    fi
}

# 清理旧备份
cleanup_old_backups() {
    log "清理 ${BACKUP_RETENTION_DAYS} 天前的备份文件"
    find "$BACKUP_DIR" -name "etcd-snapshot-*.db" -mtime +${BACKUP_RETENTION_DAYS} -delete
}

# 执行备份
perform_backup() {
    local BACKUP_FILE="$BACKUP_DIR/etcd-snapshot-$(date +%Y%m%d-%H%M%S).db"
    
    log "开始备份 etcd 数据到 $BACKUP_FILE"
    
    ETCDCTL_API=3 etcdctl snapshot save "$BACKUP_FILE" \
        --endpoints="$ENDPOINTS" \
        --cacert="$CACERT" \
        --cert="$CERT" \
        --key="$KEY" || handle_error "备份失败"
    
    # 验证备份文件
    if [ -f "$BACKUP_FILE" ]; then
        log "验证备份文件"
        ETCDCTL_API=3 etcdctl snapshot status "$BACKUP_FILE" --write-out=table || handle_error "备份文件验证失败"
    else
        handle_error "备份文件未创建"
    fi
}

# 主函数
main() {
    log "开始 etcd 备份流程"
    
    # 检查 etcdctl 是否安装
    if ! command -v etcdctl &> /dev/null; then
        handle_error "etcdctl 命令未找到，请先安装"
    }
    
    # 检查证书文件
    for cert_file in "$CACERT" "$CERT" "$KEY"; do
        if [ ! -f "$cert_file" ]; then
            handle_error "证书文件不存在: $cert_file"
        fi
    done
    
    create_backup_dir
    perform_backup
    cleanup_old_backups
    
    log "备份完成"
}

# 执行主函数
main