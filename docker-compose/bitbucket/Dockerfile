FROM atlassian/bitbucket-server
USER root
# 将代理破解包加入容器
WORKDIR /opt/atlassian/bitbucket/
#COPY mysql-connector-java-8.0.21.jar /var/atlassian/application-data/bitbucket/lib
COPY "atlassian-agent.jar" SSLPoke.class public.crt /opt/atlassian/bitbucket/
# 设置启动加载代理包
RUN apt update && apt install vim inetutils-ping -y
#RUN echo 'JAVA_OPTS="-javaagent:/opt/atlassian/bitbucket/atlassian-agent.jar -classpath $INST_DIR/app $JAVA_OPTS $BITBUCKET_ARGS $JMX_OPTS $JVM_REQUIRED_ARGS $JVM_SUPPORT_RECOMMENDED_ARGS"' >> /opt/atlassian/bitbucket/bin/_start-webapp.sh
# 设置自签名证书
# keytool -import -alias sinux.com -keystore /opt/java/openjdk/jre/lib/security/cacerts -file public.crt
# 密码 changeit

