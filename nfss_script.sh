#!/bin/bash

#установка nfs сервер

apt install nfs-kernel-server

#создаем и выдает права на директорию для дальнейшего экспорта

mkdir -p /srv/share/upload 

chown -R nobody:nogroup /srv/share 

chmod 0777 /srv/share/upload

#в файле /etc/exports создаем структуру для экспорта

cat << EOF > /etc/exports 
/srv/share 192.168.1.155/32(rw,sync,root_squash)
EOF

#экспортируем данную директорию

root@nfss:/etc# exportfs -r

#создаем тестовый файл

touch /srv/share/upload/test_file

