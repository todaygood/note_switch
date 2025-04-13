# failed to reserve container name

https://www.cnblogs.com/laggage/p/18706784/containerd-based-kubernetes-pod-startup-error-failed-to-reserve-container-nam

https://sabrnet.wzk.cz/2024/09/fix-k8s-containerd-issue-error-failed-to-reserve-container-name/


['failed to reserve container name'](https://github.com/containerd/containerd/issues/4604) 


Mitigation
If pods are failed, consider to use restartPolicy:Always or restartPolicy:OnFailure in PodSpec
Increase the boot disk IOPS (e.g. upgrade disk type or increase disk size)
Upgrade containerd with this patch oci: use readonly mount to read user/group info #6478 which will be available in 1.6+ and 1.5.X(backport working in progress)

https://github.com/containerd/containerd/pull/6478