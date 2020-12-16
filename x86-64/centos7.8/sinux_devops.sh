#!/bin/bash
##  scp -P 23 sinux_devops.sh 192.168.3.245:/root/wufei
##  ssh 192.168.3.245 -p 23
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo  
curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo  
yum install -y lrzsz vim telnet tar lsof wget net-tools epel-release
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config 
systemctl stop firewalld  
systemctl disable firewalld  
curl https://get.docker.com |env CHANNEL=stable sudo sh -s docker --mirror Aliyun  
systemctl start docker
#mkdir -p /etc/docker
echo "192.168.3.240  harbor.sinux.com" >> /etc/hosts
sudo tee /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://erh9is1d.mirror.aliyuncs.com"],
  "insecure-registries":["harbor.sinux.com"]
} 
EOF
systemctl restart docker 
systemctl enable docker 
docker run -d -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=Sinux2020 jboss/keycloak


