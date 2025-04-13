# 

## containerd 配置文件 

https://github.com/containerd/containerd/blob/main/docs/cri/config.md

 [plugins.'io.containerd.cri.v1.runtime']
    enable_selinux = false
    selinux_category_range = 1024
    max_container_log_line_size = 16384
    disable_cgroup = false
    disable_apparmor = false
    restrict_oom_score_adj = false
    disable_proc_mount = false
    unset_seccomp_profile = ''
    tolerate_missing_hugetlb_controller = true
    disable_hugetlb_controller = true
    device_ownership_from_security_context = false

[VM Export of FileSystem PVC fails due to permissions issue](https://github.com/kubevirt/kubevirt/issues/9742)

https://github.com/kubevirt/containerized-data-importer/pull/2458

https://github.com/kubevirt/containerized-data-importer/issues/2447#issuecomment-1302551650

https://github.com/kubevirt/containerized-data-importer/issues/2433


https://bugzilla.redhat.com/show_bug.cgi?id=2156525


Verified on CNV-v4.13.3.rhel9-175

$ oc get pvc
NAME            STATUS   VOLUME      CAPACITY   ACCESS MODES   STORAGECLASS   AGE
cirros-dv-nfs   Bound    nfs-pv-01   5Gi        RWO,RWX        nfs            23s

$ virtctl vmexport create export-pvc-nfs --pvc=cirros-dv-nfs
VirtualMachineExport 'default/export-pvc-nfs' created succesfully

$ oc get vmexport 
NAME             SOURCEKIND              SOURCENAME      PHASE
export-pvc-nfs   PersistentVolumeClaim   cirros-dv-nfs   Ready

$ virtctl vmexport download export-pvc-nfs --output=disk-pvc-nfs.img --keep-vme
Downloading file: 12.64 MiB [====>______________] 1.23 MiB p/s                                                                                                              
Download finished succesfully

$ ll | grep disk-pvc-nfs.img
-rw-rw-r--.  1 cloud-user cloud-user 13255182 Aug  2 10:04 disk-pvc-nfs.img\




https://github.com/k3s-io/k3s/issues/11168


[KubeVirt to Kubernetes version support matrix](https://github.com/kubevirt/sig-release/blob/main/releases/k8s-support-matrix.md)




