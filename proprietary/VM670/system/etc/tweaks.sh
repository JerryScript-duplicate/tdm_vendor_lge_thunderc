#!/system/bin/sh

#---------------------#
#made by: franciscofranco @ xda
#thanks ungaze for the lively discussions and for pointing me some of the early versions of these scripts
#thanks mmarz for the little fix 
#---------------------#


#remounting the file systems with noatime and nodiratime flags to save battery and CPU cycles

for k in $(busybox mount | grep relatime | cut -d " " -f3)
do
sync
busybox mount -o remount,noatime,nodiratime $k
done


#flags every mounted partition as non rotational and increases it's cache size for more read speed

MTD=`ls -d /sys/block/mtd*`;
LOOP=`ls -d /sys/block/loop*`;
RAM=`ls -d /sys/block/ram*`;
MMC=`ls -d /sys/block/mmc*`;

for j in $MTD $LOOP $RAM
do
	echo "0" > $j/queue/rotational;
	echo "2048" > $j/queue/read_ahead_kb;
	
done

echo "2048" > /sys/devices/virtual/bdi/179:0/read_ahead_kb;

#optimizations for non-rotating storage

SCHEDULER_MTD=`cat /sys/block/mtdblock1/queue/scheduler`;
SCHEDULER_MTD=${SCHEDULER_MTD%]*};
SCHEDULER_MTD=${SCHEDULER_MTD#*[};
SCHEDULER_MMC=`cat /sys/block/mmcblk0/queue/scheduler`;
SCHEDULER_MMC=${SCHEDULER_MMC%]*};
SCHEDULER_MMC=${SCHEDULER_MMC#*[};
echo $SCHEDULER_MTD
echo $SCHEDULER_MMC
if [ "$SCHEDULER_MTD" == "bfq" ] || [ "$SCHEDULER_MTD" == "cfq" ]; then

for a in $MTD
do

echo 1 > $a/queue/iosched/low_latency;
echo 16 > $a/queue/iosched/quantum;
echo 1 > $a/queue/iosched/back_seek_penalty;
echo 0 > $a/queue/iosched/slice_idle;
echo 512 > $a/queue/nr_requests;

done

fi

if [ "$SCHEDULER_MMC" == "bfq" ] || [ "$SCHEDULER_MMC" == "cfq" ]; then

for a in $MMC
do

echo 1 > $a/queue/iosched/low_latency;
echo 16 > $a/queue/iosched/quantum;
echo 1 > $a/queue/iosched/back_seek_penalty;
echo 0 > $a/queue/iosched/slice_idle;
echo 512 > $a/queue/nr_requests;

done

fi

#internet speed tweaks

echo 0 > /proc/sys/net/ipv4/tcp_timestamps;
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse;
echo 1 > /proc/sys/net/ipv4/tcp_sack;
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle;
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling;
echo 5 > /proc/sys/net/ipv4/tcp_keepalive_probes;
echo 30 > /proc/sys/net/ipv4/tcp_keepalive_intvl;
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout;
echo 404480 > /proc/sys/net/core/wmem_max;
echo 404480 > /proc/sys/net/core/rmem_max;
echo 256960 > /proc/sys/net/core/rmem_default;
echo 256960 > /proc/sys/net/core/wmem_default;
echo 4096 16384 404480 > /proc/sys/net/ipv4/tcp_wmem;
echo 4096 87380 404480 > /proc/sys/net/ipv4/tcp_rmem;


#vm management tweaks

echo "50" > /proc/sys/vm/swappiness;
echo "95" > /proc/sys/vm/dirty_ratio;
echo "10" > /proc/sys/vm/vfs_cache_pressure;
echo "20480" > /proc/sys/vm/min_free_kbytes;
echo "1" > /proc/sys/vm/oom_kill_allocating_task;
echo "0" > /proc/sys/vm/laptop_mode;
echo "60000" > /proc/sys/vm/dirty_expire_centisecs;
echo "60" > /proc/sys/vm/dirty_background_ratio;
echo "1536,3072,4096,21000,23000,25000" > /sys/module/lowmemorykiller/parameters/minfree;
echo "6000" > /proc/sys/vm/dirty_writeback_centisecs;


#kernel tweaks

echo "8" > /proc/sys/vm/page-cluster;
echo "64000" > /proc/sys/kernel/msgmni;
echo "64000" > /proc/sys/kernel/msgmax;
echo "10" > /proc/sys/fs/lease-break-time;
echo 500 512000 64 2048 > /proc/sys/kernel/sem;


#sqlite .db files optimization

#for i in \
#`find /data -iname "*.db"`
#do \
#	sqlite3 $i 'VACUUM;'; 
#done

#prop tweaks

setprop wifi.supplicant_scan_interval 300;
setprop windowsmgr.max_events_per_sec 260;
setprop ro.lge.proximity.delay 25;
setprop mot.proximity.delay 25;
setprop net.tcp.buffersize.default 4096,87380,256960,4096,16384,256960;
setprop net.tcp.buffersize.wifi 4096,87380,256960,4096,16384,256960;
setprop net.tcp.buffersize.umts 4096,87380,256960,4096,16384,256960;
setprop ro.HOME_APP_ADJ 1;
setprop debug.sf.hw 1;
setprop ro.mot.eri.losalert.delay 1000;
setprop video.accelerate.hw 1;
setprop ro.ril.disable.power.collapse 0;
setprop pm.sleep_mode 1;
