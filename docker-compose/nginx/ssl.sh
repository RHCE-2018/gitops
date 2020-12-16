#!/bin/bash

# 在该目录下操作生成证书，正好供harbor.yml使用
mkdir -p /data/cert
cd /data/cert

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=ck.sinux.com" -key ca.key -out ca.crt
openssl genrsa -out ck.sinux.com.key 4096
openssl req -sha512 -new -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=ck.sinux.com" -key ck.sinux.com.key -out ck.sinux.com.csr

cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=ck.sinux.com
DNS.2=harbor
DNS.3=ks-allinone
EOF

openssl x509 -req -sha512 -days 3650 -extfile v3.ext -CA ca.crt -CAkey ca.key -CAcreateserial -in ck.sinux.com.csr -out ck.sinux.com.crt
    
openssl x509 -inform PEM -in ck.sinux.com.crt -out ck.sinux.com.cert

cp ck.sinux.com.crt /etc/pki/ca-trust/source/anchors/ck.sinux.com.crt 
update-ca-trust

