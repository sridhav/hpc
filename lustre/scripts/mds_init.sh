#!/usr/bin/env bash
chkconfig lnet --add
chkconfig lnet on
chkconfig lustre --add
chkconfig lustre on
sudo service lnet restart
mkdir /mds
mkfs.lustre --fsname lustre --mdt --mgs /dev/vg00/mds
mount -t lustre /dev/vg00/mds /mds
