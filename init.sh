#!/bin/bash
num=${HOSTNAME##*-}
if [[ !"$num" =~ ^|0-9|+$ ]]; then
    exit
else
    echo myid is $num
    if [ ! -d "$ZOOKEEPER_DATA_DIR" ]; then
      mkdir -p "$ZOOKEEPER_DATA_DIR"
    fi
    echo $[$num+1]
    echo $[$num+1]>${ZOOKEEPER_DATA_DIR}/myid
    exit
fi