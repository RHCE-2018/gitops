# 此项目记录测控事业部Devops运维实践历程

## Vmware虚拟化平台
https://esxi.sinux.com
## 统一认证账号密码修改
https://ssp.sinux.com
## 代码仓库，持续集成
https://git.sinux.com
## 私有云盘
https://drive.sinux.com
## 文件共享
https://h5ai.sinux.com
## 操作系统命名规范
架构-系统版本  例如：phytium-kylinos-v10
## 构建镜像命名规范
架构-系统版本-QT版本:镜像版本  例如:harbor.sinux.com/opck/phytium-kylinos-v10-qt5.9.9:1.0
## 服务器操作系统
centos7.8  centos8.2  ubuntu20.04 ubuntu18.04  esxi7.0 windows10专业版 银河麒麟v10(飞腾) 银河麒麟v10(龙芯)
## docker-engine容器引擎
export release=2.2.1 && curl -C- -fLO --retry 3 https://github.com/easzlab/kubeasz/releases/download/${release}/easzup && chmod +x ./easzup  
./easzup -D -d 19.03.8  
curl https://get.docker.com |env CHANNEL=stable sudo sh -s docker --mirror Aliyun  
## docker-compose容器编排
**centos7**  
yum -y install epel-release && yum -y install python-pip && pip install --upgrade pip && pip install docker-compose  
**centos8**  
dnf install python3 -y && pip3 install --upgrade pip && pip install docker-compose
## gitlab-ce源代码管理
docker-compose -f opck.yml up -d gitlab    
gitlab-ce 13.3.5
## lazydocker容器管理
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
## gitlab-runner持续集成
**centos8**  
rpm -ivh gitlab-runner_amd64.rpm && groupadd docker && usermod -aG docker gitlab-runner && systemctl restart docker  
## jira项目管理
docker-compose  -f opck.yml up --no-deps  -d jira  
## openldap账号统一认证
docker exec -it openldap slapd -VVV
## docker镜像仓库
http://harbor.sinux.com
## k8s系统web管理端
https://192.168.3.173:32617
## rancher k8s集群管理
https://192.168.3.173:9443
## keycloak单点登录
https://192.168.3.173:8010
## spug运维管理平台
https://192.168.3.173:88
## 宝塔面板
https://192.168.3.245:8888