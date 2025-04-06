# 使用sysak



## 主机上跟踪数据包 

https://github.com/todaygood/nettrace

nettrace
pwru 


## 使用代理翻墙下载docker镜像， podman比docker要方便。 

root@ubunt2:~# source  /etc/proxy.sh 
root@ubunt2:~# podman pull docker.io/plndr/kube-vip:v0.8.10
Trying to pull docker.io/plndr/kube-vip:v0.8.10...
Getting image source signatures
Copying blob b9d72fd6816c done  
Copying blob 048c802dd042 done  
Copying config 6ff023a402 done  
Writing manifest to image destination
Storing signatures
6ff023a402a69763955de6901db6b751b18badae26bd5e8e8ef82e45353a456b


[为当前用户设置 HTTP_PROXY 和 HTTPS_PROXY 环境变量,Podman 将自动读取这些环境变量并使用代理](https://blog.csdn.net/xixihahalelehehe/article/details/136683723)


https://github.com/DaoCloud/public-image-mirror


[如何配置docker通过代理服务器拉取镜像](https://www.lfhacks.com/tech/pull-docker-images-behind-proxy/)


docker daemon 使用 HTTP_PROXY, HTTPS_PROXY, 和 NO_PROXY 三个环境变量配置代理服务器，但是你需要在 systemd 的文件里配置环境变量，而不能配置在 daemon.json 里。


