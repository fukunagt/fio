#! /bin/sh 
# Script file for sequential write performance

# Block size
BSIZE[0]="1K"
BSIZE[1]="2K"
BSIZE[2]="4K"
BSIZE[3]="8K"
BSIZE[4]="16K"
BSIZE[5]="32K"
BSIZE[6]="64K"
BSIZE[7]="128K"
BSIZE[8]="256K"
BSIZE[9]="512K"
BSIZE[10]="1M"
BSIZE[11]="2M"
BSIZE[12]="4M"
BSIZE[13]="8M"
BSIZE[14]="16M"
BSIZE[15]="32M"
BSIZE[16]="64M"
BSIZE[17]="128M"
BSIZE[18]="256M"
BSIZE[19]="512M"

# Parameters
# File name
FNAME="/mnt/md01/fio-benchmark"
# Type
RW="randwrite"
# File size
FSIZE="8G"
# Runtime
RUNTIME="60"
# Job name
JOB=md

# Run fio
for bsize in ${BSIZE[@]}
do
	echo $bsize
	fio -filename=${FNAME} -direct=1 -rw=${RW} -bs=$bsize -size=${FSIZE} -runtime=${RUNTIME} -name=${JOB}-$bsize
done
