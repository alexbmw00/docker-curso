#!/bin/bash

HOSTS=$(head -n10 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
cat >> /etc/hosts <<EOF
27.11.90.10 docker1  
27.11.90.20 docker2
27.11.90.30 docker3
EOF

apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

DOCKER_EE_URL='https://storebits.docker.com/ee/trial/sub-d7554489-82b6-431f-82c3-7e3f359915ee'
DOCKER_EE_VERSION='19.03'

curl -fsSL "${DOCKER_EE_URL}/ubuntu/gpg" | sudo apt-key add -

add-apt-repository "deb [arch=$(dpkg --print-architecture)] $DOCKER_EE_URL/ubuntu $(lsb_release -cs) stable-$DOCKER_EE_VERSION"

apt-get install -y docker-ee docker-ee-cli containerd.io

apt-get clean
