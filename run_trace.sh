#!/bin/bash

echo "Storage Trace Tool"
timestamp=`date +%Y%m%d%H%M`
echo $timestamp
mkdir -p $timestamp
#echo -e "Get root password for sudo command"
#read pswrd
echo -e "Enter device path: ex) /dev/nvme0n1"
read device
#device="/dev/nvme0n1"
echo "Device path : "$device""
echo -e "Trace Time(seconds) : ex) 600"
read runtime
#runtime="600"
echo "Trace time : "$runtime""

echo "Running trace programs : "$runtime""
#echo "Running trace programs : need to root passwd"
#echo "blktrace root password" | sudo blktrace -d $device -w $runtime -o blk_"$timestamp" > blk_"$timestamp".log &
#echo "iostat root password" | sudo iostat -cdtx 5 $device >> iostat_"$timestamp".log &
sudo blktrace -d $device -w $runtime -o blk_"$timestamp" > blk_"$timestamp".log &
sudo iostat -cdtx 5 $device >> iostat_"$timestamp".log & 
sudo ./do_smartctl.sh $device $timestamp & 

echo ""$runtime"secs Waiting..."
sleep "${runtime}"

killall blktrace
killall iostat
killall do_smartctl.sh

mv *.log ./$timestamp
mv blk_"$timestamp".* ./$timestamp

echo "Tracing Terminated, check log files"

:<<'END'
Program Usage Example#
blkparse -i trace.blktrace.* -d test.bin
btt -i test.bin | more 
seekwatcher -t device_blktrace_*
END
