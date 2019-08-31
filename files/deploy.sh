#!/bin/bash

# Instala todos os serviços

echo 'Instalando o UCP...'
bash /root/ucp.sh

echo 'Adicionando máquinas ao cluster...'
JOIN=$(docker swarm join-token worker | grep 2377)
ssh -o stricthostkeychecking=no suporte@docker2 sudo $JOIN
ssh -o stricthostkeychecking=no suporte@docker3 sudo $JOIN

echo 'Aguardando a inicialização dos workers...'
echo 'Enquanto isso: Baixando imagens do Jenkins e Gitlab'
ssh suporte@docker2 sudo docker pull gitlab/gitlab-ce
ssh suporte@docker3 sudo docker pull jenkins/jenkins:lts

echo 'Instalando DTR...'
bash /root/dtr.sh

echo 'Instalando os componentes da infraestrutura...'
bash /root/infra.sh
