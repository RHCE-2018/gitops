# 中科合讯Devops 2020.7.20

jira:
  image: sinux/jira:1.0
  container_name: jira
  environment:
    - TZ='Asia/Shanghai'
    - JVM_MINIMUM_MEMORY=1g
    - JVM_MAXIMUM_MEMORY=12g
    - JVM_CODE_CACHE_ARGS='-XX:InitialCodeCacheSize=1g -XX:ReservedCodeCacheSize=8g'
  depends_on:
    - mysql
  ports:
    - "8080:8080"
  volumes:
    - /application/jira:/var/jira
  restart: always
mysql:
  image: mysql:5.7
  container_name: mysql
  environment:
    - TZ='Asia/Shanghai'
    - MYSQL_DATABASE=jira
    - MYSQL_ROOT_PASSWORD=Sinux2020
    - MYSQL_USER=jira
    - MYSQL_PASSWORD=Sinux2020
  command: ['mysqld', '--character-set-server=utf8mb4', '--collation-server=utf8mb4_bin']
  ports:
    - "13306:3306"
  volumes:
    - /application/mysql:/var/lib/mysql
  restart: always
                

# 第一阶段

## Dell服务器R720  IDRAC升级固件
192.168.3.243   root  calvin  新密码Sinux2020
idarc   D7文件
bios    EXE
阵列卡驱动  EXE
F10
硬盘驱动   EXE

## Linux (CentOS Linux release 7.8.2003 (Core))
**centos8**  curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo  
**centos8**  yum install -y https://download.docker.com/linux/fedora/30/x86_64/stable/Packages/containerd.io-1.2.6-3.3.fc30.x86_64.rpm 
 
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo  
yum install -y lrzsz vim telnet tar lsof wget net-tools epel-release
vim /etc/selinux/config  
systemctl disable firewalld  
curl https://get.docker.com |env CHANNEL=stable sudo sh -s docker --mirror Aliyun  
systemctl start docker  
vim /etc/docker/daemon.json  
{
  "registry-mirrors": ["https://erh9is1d.mirror.aliyuncs.com"],
  "insecure-registries":["harbor.sinux.com:8888"]
}  
systemctl restart docker  
systemctl enable  docker

## Rancher v2.4.5
docker run -d --restart=unless-stopped --name rancher -v /application/runcher:/var/lib/rancher/ -p 80:80 -p 443:443 rancher/rancher:stable
nginx.ingress.kubernetes.io/rewrite-target=/
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.4.5 --server https://rancher.sinux.com --token xbcmwzjvpwzkzqzv7bmrhjhhl8hdxwlzxjt575d97v5d4wvk6h26cg --ca-checksum 468324269c8e1a08e505ff0ead6f19ca0ca3c82af5c5301e405d784fdcd78247 --etcd --controlplane --worker
cattle-cluster-agent容器添加hosts   
192.168.3.242  rancher.sinux.com  
点击集群   添加持久卷  
部署工作负载  
添加端口映射  
添加环境变量    
挂载数据卷（添加新的PVC)

## postgres
docker run -d --name postgres --restart always -e POSTGRES_USER='postgres' -e POSTGRES_PASSWORD='123456' -e ALLOW_IP_RANGE=0.0.0.0/0 -v /application/postgresql/data:/var/lib/postgresql/data -p 55433:5432  postgres:10 

## docker images
vim Dockerfile

FROM centos:latest
RUN yum -y update && yum -y groupinstall 'Development Tools' openssh-server vim passwd curl wget && \ 
yum clean all && \
rm -rf /tmp/* /var/tmp/

docker build -t harbor.sinux.com:8888/library/centos:v1.0 .
docker run -it -p 2200:22 -v /application/centos:/app 95a23dcbb4a9  bash

ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ”
ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ”
ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ”

passwd

docker commit -a "wufei" -m "this is test" e597ff20c628 harbor.sinux.com:8888/library/centos:v2.0
docker run -itd -p 2200:22 -v /application/centos:/app harbor.sinux.com:8888/library/centos:v2.0

## jboss/keycloak:latest
RKE部署
增加环境变量
KEYCLOAK_PASSWORD=Sinux2020
KEYCLOAK_USER=admin
PROXY_ADDRESS_FORWARDING=true

## docker pull atlassian/jira-software:latest 
RKE部署	 
ATL_PROXY_NAME=ck.sinux.com 	
ATL_PROXY_PORT=443
ATL_TOMCAT_CONTEXTPATH=jira
ATL_TOMCAT_SCHEME=https
ATL_TOMCAT_SECURE=true 	
高级技巧: 在键(Key)输入栏中粘贴一行或多行的key=value键值对能够批量输入。
vim /etc/nginx/nginx.conf
  location /jira {
    proxy_set_header        Host $host:$server_port;
    proxy_set_header        X-Real-IP $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header        X-Forwarded-Proto $scheme;
    proxy_redirect          http:// https://;
    proxy_pass              http://192.168.3.244:9010/jira; # sh-kvm-3-1这里为jira所在服务器的主机名
    client_max_body_size    10M;
    proxy_set_header        X-Forwarded-Host $host;
    proxy_set_header        X-Forwarded-Server $host;
    # Required for new HTTP-based CLI
    proxy_http_version 1.1;
    proxy_request_buffering off;
  }

## docker pull atlassian/confluence-server:latest v7.6.2
RKE部署
增加环境变量
ATL_TOMCAT_CONTEXTPAT=wiki

## atlassian/bitbucket-server:latest   v7.5.0
RKE部署
vim shared/bitbucket.properties
增加
server.context-path=/git

## images.sinux.com/library/jenkins:v1.0（安装中文汉化包）
RKE部署   
增加环境变量
JENKINS_OPTS="--prefix=/jenkins"
mkdir -p /application/jenkins      
chown -R 1000:1000 /application/jenkins    
**插件加速配置** 
https://jenkins.sinux.com/pluginManager/advanced
修改升级站点

cd /var/jenkins_home/updates/
sed -i 's#https://updates.jenkins.io/download#https://mirrors.tuna.tsinghua.edu.cn/jenkins#g' default.json && sed -i 's#http://www.google.com#https://www.baidu.com#g' default.json
https://jenkins.sinux.com/restart

# 第二阶段

## Kubernetes v1.18.6
RKE
curl -sfL https://docs.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh  
helm repo add rancher-stable http://rancher-mirror.oss-cn-beijing.aliyuncs.com/server-charts/stable
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm install rancher rancher-stable/rancher \
 --namespace cattle-system \
 --set hostname=rancher.sinux.com

## mysql v5.7.31
RKE部署

## OPENLDAP
docker run -p 389:389 --restart=always --name openldap --network bridge --hostname openldap --env LDAP_ORGANISATION="sinux" --env LDAP_DOMAIN="sinux.com" --env LDAP_ADMIN_PASSWORD="Sinux_2020" --volume /application/slapd/database:/var/lib/ldap --volume /application/slapd/config:/etc/ldap/slapd.d --detach osixia/openldap  
docker run -d --privileged -p 8080:80 --restart=always --name phpldapadmin --network bridge --env PHPLDAPADMIN_HTTPS=false -v /application/config/:/container/service/phpldapadmin/assets/config/ --env PHPLDAPADMIN_LDAP_HOSTS=192.168.10.122 -d osixia/phpldapadmin  
chomd 777 /application/slapd  
rm -rf /application/slapd(无法修复时使用）  
docker-compose -f openldap.yml up -d

## Gitlab-ce v13.2.3
RKE部署  
rz  上传（gitlab.yml)  
docker run -d -p 443:443 -p 80:80 -p 23:22 --name gitlab --restart=always -v /application/gitlab/config:/etc/gitlab --volume /application/gitlab/logs:/var/log/gitlab --volume /application/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:latest  
docker-compose -f gitlab.yml up -d  
vim /application/gitlab/config/gitlab.rb  
增加  external_url 'http://192.168.3.244'  可无需操作
docker exec -it  gitlab gitlab-ctl reconfigure 可无需操作


## Harbor v2.0.1
rz  上传（docker-compose-Linux-x86_64  harbor-offline-installer-v2.0.1.tgz）
wget https://github.com/goharbor/harbor/releases/download/v2.0.1/harbor-offline-installer-v2.0.1.tgz
tar -zxvf harbor-offline-installer-v2.0.1.tgz
cd /root/harbor
vim harbor.yml(注释HTTPS）    
mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose  
chmod +x /usr/local/bin/docker-compose  
docker-compose up -d  
docker login 192.168.10.240:8080     admin   Harbor12345

## NGINX
docker run --name nginx -d -p 80:80 -v /application/nginx/html:/usr/share/nginx/html -v /application/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v /application/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf -v /application/nginx/logs:/var/log/nginx nginx:stable
docker run --name nginx  -v /application/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v /application/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf -d -p 80:80 nginx:stable

## Nextcloud
rz  上传（nextcloud.yml)  
docker-compose -f nextcloud.yml up -d

## Docker-Swarm
##version: '2'##  
docker stack deploy -c visualizer.yml visualizer  
docker stack deploy -c nextcloud.yml nextcloud  






