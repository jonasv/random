#!/bin/bash
#author unknown

set -xv
HOSTNAME=`hostname --short`

GRAPHITE=127.0.0.1
GRAPHITE_PORT=2003

while true; do
    DATE=`date +%s`

    MY_DATA=`ls /tmp | wc -l`

    echo "stats.${HOSTNAME}.tmp.file.count ${MY_DATA} ${DATE}" | nc $GRAPHITE $GRAPHITE_PORT

    sleep 10
done

