#!/bin/bash

while true; do
free -b | awk '/Mem:/ { printf "out|string|%.1fGB\n", $3/1073741824, $2/1073741824 }'
echo ""
sleep 1
done 
