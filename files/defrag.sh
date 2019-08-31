#!/bin/bash

# Este script é utilizado para remover os espaços em branco do HD de instalação,
# copiando todo o seu conteúdo para um novo HD.

if [ -z "$1" ]; then
	cat <<EOF
Exemplo:

bash transfer.sh /dev/sdb2

Especifique a partição para onde os dados serão copiados.
Não é preciso montar a partição, apenas formatá-la.
EOF
	exit 1
fi

if [ ! -b $1 ]; then
	echo "Dispositivo $1 não existe"
	exit 2
fi

mount $1 /mnt

cd /
for X in $(ls -1 /); do
	if [ -z "$(echo $X | grep -E 'mnt|proc|sys|dev')" ]; then
		cp -av /$X /mnt
	fi
done

mkdir -p /mnt/{dev,proc,sys}
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys

cat <<EOF
Os arquivos foram copiados. Os próximos passos são os seguintes:
1. chroot /mnt
2. blkid /dev/<dispositivos> ex: /dev/sdb1 /dev/sdb2
3. vim /etc/fstab
4. vim /etc/initramfs-tools/conf.d/resume - alterar UUID
5. vim /etc/initramfs-tools/initramfs.conf - MODULES=dep, COMPRESS=xz
6. update-initramfs -u
7. grub-install /dev/<dispositivo> ex: /dev/sdb
8. update-grub
EOF

