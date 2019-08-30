#!/bin/bash

apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

DOCKER_EE_URL='https://storebits.docker.com/ee/trial/sub-d7554489-82b6-431f-82c3-7e3f359915ee'
DOCKER_EE_VERSION='19.03'

curl -fsSL "${DOCKER_EE_URL}/ubuntu/gpg" | sudo apt-key add -

add-apt-repository "deb [arch=$(dpkg --print-architecture)] $DOCKER_EE_URL/ubuntu $(lsb_release -cs) stable-$DOCKER_EE_VERSION"

apt-get install -y docker-ee docker-ee-cli containerd.io
