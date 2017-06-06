#!/usr/bin/env bash
# check_number() {
#     if [ "$1" -eq "$1" ]; then
#         return true
#     fi
    
#     return false
# }

vdi_location="$HOME/VirtualBox VMs"
cflag=
mflag=
dflag=
nflag=
rflag=
sflag=
tflag=
sval=
tval=
mval=2
cval=1
dval=30
nval=1
rval=
while getopts c:m:n:r:s:t: name
do
    case $name in
    c)  cflag=1
        cval="$OPTARG"
        ;;
    m)  mflag=1
        mval="$OPTARG"
        ;;
    d)  dflag=1
        dval="$OPTARG"
        ;;
    n)  nflag=1
        nval="$OPTARG"
        ;;
    r)  rflag=1
        rval="$OPTARG"
        ;;
    s)  sflag=1
        sval="$OPTARG"
        ;;
    t)  tflag=1
        tval="$OPTARG"
        ;;
    ?)  printf "Usage: %s: [-c value] [-m value] [-n value] \n" $0
        exit 2
        ;;
    esac
done

if [ ! -z "$rflag" ]; then
    VBoxManage controlvm "$rval" poweroff
    VBoxManage unregistervm "$rval" --delete
    exit 0 
fi

if [ ! -z "$sflag" ]; then
    VBoxManage startvm "$sval" --type headless
    exit 0
fi

if [ ! -z "$tflag" ]; then
    VBoxManage controlvm "$tval" poweroff
    exit 0
fi

for i in `seq 1 $nval`; do
    dval=$((dval*1024))
    mval=$((mval*1024))
    vm="rocks-0-$i"
    vdi="$vdi_location/$vm/$vm.vdi"
    VBoxManage createmedium disk --filename "$vdi" --size $dval --format VDI --variant Standard
    VBoxManage createvm --name "$vm" --ostype "Linux26_64" --register
    VBoxManage storagectl $vm --name "SATA Controller" --add sata --controller IntelAHCI
    VBoxManage storageattach $vm --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$vdi"
    VBoxManage modifyvm $vm --cpus $cval
    VBoxManage modifyvm $vm --memory $mval --vram 128
    VBoxManage modifyvm $vm --boot1 net --boot2 disk --boot3 dvd --boot4 none
    VBoxManage modifyvm $vm --nic1 intnet --intnet1 rocks_internal
    VBoxManage startvm $vm --type headless
done


