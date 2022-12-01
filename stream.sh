#!/bin/bash

localip="<LOCAL IP>"
port="<LISTEN PORT>"
endpoint="<INGEST ENDPOINT>"
streamkey="<STREAM KEY>"

ffmpeg \
        -i "srt://"$localip":"$port"?mode=listener&transtype=live&latency=200000" \
        -c copy \
        -f flv \
        $endpoint$streamkey
