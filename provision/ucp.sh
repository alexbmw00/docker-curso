#!/bin/bash

docker image pull docker/ucp:3.2.0

docker container run --rm -it --name ucp \
-v /var/run/docker.sock:/var/run/docker.sock \
docker/ucp:3.2.0 install \
--force-minimums \
--host-address 27.11.90.10 \
--interactive
