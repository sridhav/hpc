#!/usr/bin/env bash
chkconfig lnet --add
chkconfig lnet on
sudo service lnet restart
mkdir /mnt/lustre
mount -t lustre 192.168.70.10@tcp:/lustre /mnt/lustre