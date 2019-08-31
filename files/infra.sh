#!/bin/bash

cd /root/infra
docker stack deploy --compose-file gitlab-compose.yml 'scm'
docker stack deploy --compose-file jenkins-compose.yml 'ci-cd'
docker stack deploy --compose-file prometheus-grafana-compose.yml 'monitoring'
