# 四层代理


## 环境： 192.168.59.1:7897 是clash verge

```bash
root@debian12:~# export proxy=192.168.59.1:7897
export no_proxy=127.0.0.0/24,localhost,192.168.0.0/16
export http_proxy=http://$proxy  https_proxy=http://$proxy
-bash: export: `localhost,192.168.0.0/16': not a valid identifier
root@debian12:~# wget https://github.com/snail007/goproxy/releases/download/v15.0/proxy-darwin-amd64.tar.gz
--2025-04-05 11:33:42--  https://github.com/snail007/goproxy/releases/download/v15.0/proxy-darwin-amd64.tar.gz
Connecting to 192.168.59.1:7897... connected.
Proxy request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/103126070/6930b8ce-9afb-4f07-84f9-9566e88f1a96?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250405T033343Z&X-Amz-Expires=300&X-Amz-Signature=e01ae4b75df36733a484d2e9284707d59afb358ae4506ca37b515480e7e7212e&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dproxy-darwin-amd64.tar.gz&response-content-type=application%2Foctet-stream [following]
--2025-04-05 11:33:43--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/103126070/6930b8ce-9afb-4f07-84f9-9566e88f1a96?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250405T033343Z&X-Amz-Expires=300&X-Amz-Signature=e01ae4b75df36733a484d2e9284707d59afb358ae4506ca37b515480e7e7212e&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dproxy-darwin-amd64.tar.gz&response-content-type=application%2Foctet-stream
Connecting to 192.168.59.1:7897... connected.
Proxy request sent, awaiting response... 200 OK
Length: 8465698 (8.1M) [application/octet-stream]
Saving to: ‘proxy-darwin-amd64.tar.gz’

proxy-darwin-amd64.tar.gz                      100%[===================================================================================================>]   8.07M  8.23MB/s    in 1.0s    

2025-04-05 11:33:45 (8.23 MB/s) - ‘proxy-darwin-amd64.tar.gz’ saved [8465698/8465698]

```

## 验证 我做的代理，是否支持https

### 使用goproxy 在192.168.59.129 做一个四层代理

```bash
root@debian12:~/goproxy# ls
auth-file  blocked  direct  hosts  ip.allow  ip.deny  ip.limit  only  proxy  proxy-linux-amd64.tar.gz  resolve.rules  rewriter.rules  rhttp.toml  run.sh  stop
root@debian12:~/goproxy# cat run.sh 
#!/bin/bash

./proxy tcp -p ":17897" -T tcp -P "192.168.59.1:7897"

root@debian12:~/goproxy# ./run.sh  
2025/04/05 11:47:31.691 INFO use tcp parent [192.168.59.1:7897]
2025/04/05 11:47:31.693 INFO tcp proxy on [::]:17897


2025/04/05 11:48:48.392 INFO conn 192.168.59.121:36854 - 192.168.59.129:17897 - 192.168.59.1:7897 connected
2025/04/05 11:48:49.604 INFO conn 192.168.59.121:53736 - 192.168.59.129:17897 - 192.168.59.1:7897 connected
2025/04/05 11:48:50.677 INFO conn 192.168.59.121:36854 - 192.168.59.129:17897 - 192.168.59.1:7897 released
```


### 测试goproxy 

```bash
export proxy=192.168.59.129:17897
export no_proxy=127.0.0.0/24,localhost,192.168.0.0/16
export http_proxy=http://$proxy  https_proxy=http://$proxy

[root@anolis882 ~]# export proxy=192.168.59.129:17897
[root@anolis882 ~]# export no_proxy=127.0.0.0/24,localhost,192.168.0.0/16
[root@anolis882 ~]# export http_proxy=http://$proxy  https_proxy=http://$proxy

[root@anolis882 ~]# wget https://github.com/snail007/goproxy/releases/download/v15.0/proxy-linux-amd64_commercial.tar.gz
--2025-04-05 11:48:59--  https://github.com/snail007/goproxy/releases/download/v15.0/proxy-linux-amd64_commercial.tar.gz
Connecting to 192.168.59.129:17897... connected.
Proxy request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/103126070/b26d22f2-5471-40a5-bdcf-49b007c6c24f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250405T034849Z&X-Amz-Expires=300&X-Amz-Signature=586fc0441b6bafe7766bc70eb05a57e5a95f49f214f6d37b51f0a2a2c7cdb26c&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dproxy-linux-amd64_commercial.tar.gz&response-content-type=application%2Foctet-stream [following]
--2025-04-05 11:49:00--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/103126070/b26d22f2-5471-40a5-bdcf-49b007c6c24f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250405T034849Z&X-Amz-Expires=300&X-Amz-Signature=586fc0441b6bafe7766bc70eb05a57e5a95f49f214f6d37b51f0a2a2c7cdb26c&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dproxy-linux-amd64_commercial.tar.gz&response-content-type=application%2Foctet-stream
Connecting to 192.168.59.129:17897... connected.
Proxy request sent, awaiting response... 200 OK
Length: 8202366 (7.8M) [application/octet-stream]
Saving to: ‘proxy-linux-amd64_commercial.tar.gz’

proxy-linux-amd64_commercial.tar.gz            100%[===================================================================================================>]   7.82M  8.35MB/s    in 0.9s    

2025-04-05 11:49:02 (8.35 MB/s) - ‘proxy-linux-amd64_commercial.tar.gz’ saved [8202366/8202366]

```


## 用nginx做的四层代理，也没有问题


### 使用nginx

```bash
root@ubunt2:/etc/nginx# nginx -v 
nginx version: nginx/1.18.0 (Ubuntu)
root@ubunt2:/etc/nginx# systemctl status nginx 
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2025-04-05 04:40:54 UTC; 9s ago
       Docs: man:nginx(8)
    Process: 6350 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 6351 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 6352 (nginx)
      Tasks: 3 (limit: 4521)
     Memory: 3.4M
        CPU: 95ms
     CGroup: /system.slice/nginx.service
             ├─6352 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             ├─6353 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             └─6354 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Apr 05 04:40:54 ubunt2 systemd[1]: Starting A high performance web server and a reverse proxy server...
Apr 05 04:40:54 ubunt2 systemd[1]: Started A high performance web server and a reverse proxy server.
root@ubunt2:/etc/nginx# cat /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}


stream {
  upstream test_mysql {
    hash $remote_addr consistent;                               # 通过配置一致性 hash 来防止调度异常
    server 192.168.59.1:7897 weight=5 max_fails=3 fail_timeout=30s;
  }
  server {
    listen 27897 so_keepalive=on;                               # 开启 TCP 存活探测
    proxy_connect_timeout 10s;                                  # 连接超时时间
    proxy_timeout 300s;                                                 # 端口保持时间
    proxy_pass test_mysql;
  }
}
```

### 测试nginx 

```bash
[root@anolis882 ~]# export proxy=192.168.59.131:27897
[root@anolis882 ~]# export no_proxy=127.0.0.0/24,localhost,192.168.0.0/16
[root@anolis882 ~]# export http_proxy=http://$proxy  https_proxy=http://$proxy
[root@anolis882 ~]# wget https://github.com/snail007/goproxy/releases/download/v15.0/proxy-linux-amd64_commercial.tar.gz
--2025-04-05 12:42:06--  https://github.com/snail007/goproxy/releases/download/v15.0/proxy-linux-amd64_commercial.tar.gz
Connecting to 192.168.59.131:27897... connected.
Proxy request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/103126070/b26d22f2-5471-40a5-bdcf-49b007c6c24f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250405T044156Z&X-Amz-Expires=300&X-Amz-Signature=153a8e9d3615f505a2ae105e9b405768bfb8f20f4eb4568ed330148498045693&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dproxy-linux-amd64_commercial.tar.gz&response-content-type=application%2Foctet-stream [following]
--2025-04-05 12:42:08--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/103126070/b26d22f2-5471-40a5-bdcf-49b007c6c24f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250405T044156Z&X-Amz-Expires=300&X-Amz-Signature=153a8e9d3615f505a2ae105e9b405768bfb8f20f4eb4568ed330148498045693&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dproxy-linux-amd64_commercial.tar.gz&response-content-type=application%2Foctet-stream
Connecting to 192.168.59.131:27897... connected.
Proxy request sent, awaiting response... 200 OK
Length: 8202366 (7.8M) [application/octet-stream]
Saving to: ‘proxy-linux-amd64_commercial.tar.gz.1’

proxy-linux-amd64_commercial.tar.gz.1     100%[=====================================================================================>]   7.82M  8.21MB/s    in 1.0s    

2025-04-05 12:42:10 (8.21 MB/s) - ‘proxy-linux-amd64_commercial.tar.gz.1’ saved [8202366/8202366]
```


