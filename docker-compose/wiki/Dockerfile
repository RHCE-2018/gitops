FROM atlassian/confluence-server
USER root
# 将代理破解包加入容器
WORKDIR /opt/atlassian/confluence/
COPY "atlassian-agent.jar" /opt/atlassian/confluence/
COPY public.crt /opt/atlassian/confluence/
#COPY mysql-connector-java-8.0.21.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/
# 设置启动加载代理包
RUN echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/confluence/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/confluence/bin/setenv.sh
