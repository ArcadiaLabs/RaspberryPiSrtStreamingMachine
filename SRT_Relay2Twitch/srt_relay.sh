#!/bin/bash

localip="LOCAL IP"
port="PORT"
endpoint="ENDPOINT"
streamkey="STREAMKEY"

ffmpeg \
        -i "srt://"$localip":"$port"?mode=listener&transtype=live&latency=200000" \
        -c copy \
        -f flv \
        $endpoint$streamkey
