FROM atlassian/jira-software
USER root
# 将代理破解包加入容器
WORKDIR /opt/atlassian/jira/
COPY atlassian-agent.jar /opt/atlassian/jira/
COPY mysql-connector-java-8.0.21.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib
COPY public.crt /opt/atlassian/jira/
# RUN keytool -import -alias ck.sinux.com -keystore /opt/java/openjdk/jre/lib/security/cacerts  -file public.crt 
# 设置启动加载代理包
RUN echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/jira/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/jira/bin/setenv.sh
