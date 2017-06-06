#! /usr/bin/env bash

VBoxManage dhcpserver remove --netname rocks_internal
VBoxManage dhcpserver add --netname rocks_internal --ip 192.168.60.1 --netmask 255.255.255.0 --lowerip 192.168.60.1 --upperip 192.168.60.255 --enable


