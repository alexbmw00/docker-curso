#!/bin/bash

docker run -it --rm docker/dtr install --dtr-external-url https://dtr.27-11-90-20.nip.io --ucp-node docker2 --ucp-username admin --ucp-url https://docker1.27-11-90-10.nip.io --ucp-insecure-tls
