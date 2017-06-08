#! /usr/bin/env bash
mkdir -p rpms/client
mkdir -p rpms/server

CURR_DIR=`pwd`

curl_download() {
    name=`basename $1`
    if [ ! -f "$name" ] ; then
        echo "Downloading RPM: $name"
        curl -s -O --insecure "$1"
    else
        echo "RPM Already exists"
    fi
}

#Client RPMs
cd $CURR_DIR/rpms/client
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/kmod-lustre-client-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/lustre-client-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/client/RPMS/x86_64/lustre-iokit-2.9.0-1.el7.x86_64.rpm


#Server RPMs
cd $CURR_DIR/rpms/server
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kernel-3.10.0-514.el7_lustre.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-iokit-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kmod-lustre-osd-ldiskfs-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kmod-lustre-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/lustre-tests-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/lustre/latest-release/el7/server/RPMS/x86_64/kmod-lustre-tests-2.9.0-1.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/e2fsprogs-1.42.13.wc5-7.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/e2fsprogs-libs-1.42.13.wc5-7.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/libcom_err-1.42.13.wc5-7.el7.x86_64.rpm
curl_download https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/RPMS/x86_64/libss-1.42.13.wc5-7.el7.x86_64.rpm

cd $CURR_DIR

vagrant destroy
vagrant up
vagrant reload
vagrant ssh mds -c "cd /vagrant/scripts && chmod +x *.sh && sudo ./mds_init.sh"
vagrant ssh oss-1 -c "cd /vagrant/scripts && chmod +x *.sh && sudo ./oss_init.sh"
vagrant ssh client -c "cd /vagrant/scripts && chmod +x *.sh && sudo ./client_init.sh"
