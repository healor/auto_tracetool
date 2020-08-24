#!/bin/bash

echo "Storage Trace Tool"
timestamp=`date +%Y%m%d%H%M`
echo $timestamp
mkdir -p $timestamp
echo -e "Enter device path: ex) /dev/nvme0n1 c "
read device
echo "Device path : "$device""
echo -e "Trace Time(seconds) : ex) 600 c "
read runtime
echo "Trace time : "$runtime""

#run each program => make log files 
#sudo blktrace -d $device -w $runtime -o $timestamp.bin

# 로그파일들을 날짜시간_폴더로 mv 처리