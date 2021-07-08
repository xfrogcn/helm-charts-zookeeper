#!/bin/bash
export TEST=zk01-1
num=${TEST##*-}
if [[ !"$num" =~ ^|0-9|+$ ]]; then
    exit
else
    echo myid is $num
    echo $num>myid
fi