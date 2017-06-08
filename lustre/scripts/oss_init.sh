#!/usr/bin/env bash
chkconfig lnet --add
chkconfig lnet on
chkconfig lustre --add
chkconfig lustre on
sudo service lnet restart
for i in `seq 0 9`; do
    mkdir -p /mnt/ost$i
    mkfs.lustre --fsname lustre --ost --mgsnode=192.168.70.10@tcp --index=$i /dev/vg00/ost$i
    mount -t lustre  /dev/vg00/ost$i /mnt/ost$i
done