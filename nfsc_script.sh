#!/bin/bash

# установка nfs клиента

sudo apt install nfs-common


#добалвяем в fstab точку автоматического монтирования

echo "192.168.1.167:/srv/share/ /mnt nfs vers=3,noauto,x-systemd.automount 0
0" >> /etc/fstab

#перезапускаем демоны и службы

systemctl daemon-reload 
systemctl restart remote-fs.target

#создаем тестовый файл

touch /mnt/upload/client_test_file
