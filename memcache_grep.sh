#!/bin/bash
#https://gist.github.com/kganser/6024864

host=$1
port=${PORT:-11211}
grepfor=$2
echo -e "stats items\nquit" | nc $host $port | cut -d: -f2 | sort -n | uniq | grep -v END | while read i; do echo -e "stats cachedump $i 100000\nquit" | nc $host $port | grep $grepfor; done
