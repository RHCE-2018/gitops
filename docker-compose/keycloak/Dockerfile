# docker network create keycloak-network
# docker run --name mysql -d --net keycloak-network -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_password mysql
# docker run -v /application/keycloak/server.crt:/etc/x509/https/tls.crt  -v /application/keycloak/server.key:/etc/x509/https/tls.key  -v /etc/localtime:/etc/localtime:ro  --net keycloak-network  --name keycloak -d -p 8443:8443 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=Sinux2020 jboss/keycloak
