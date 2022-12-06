#!/bin/bash

autoreconnect=true
localip="LOCAL IP"
port="PORT"
latency="200000"
endpoint="ENDPOINT"
streamkey="STREAMKEY"

function stream {
	ffmpeg \
        	-i "srt://"$localip":"$port"?mode=listener&transtype=live&latency="$latency \
        	-c copy \
        	-f flv \
        	$endpoint$streamkey
}

if [ "$autoreconnect" = true ] 
then
	for (( ; ; ))
	do
		stream
		sleep 1
	done
else
	stream
fi
