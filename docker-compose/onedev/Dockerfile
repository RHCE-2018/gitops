FROM 1dev/server
USER root
# 将代理破解包加入容器
WORKDIR /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security
COPY public.crt /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security
#RUN keytool -import -trustcacerts -alias sinux.com  -file public.crt -keystore cacerts -storepass changeit
