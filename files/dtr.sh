
#!/bin/bash

# Instala o docker trusted registry na máquina docker2

docker run -it --rm docker/dtr install \
--dtr-external-url https://dtr.27-11-90-20.nip.io \
--ucp-node docker2 \
--ucp-username 'admin' \
--ucp-password '4linux123' \
--ucp-url https://ucp.27-11-90-10.nip.io \
--ucp-insecure-tls
