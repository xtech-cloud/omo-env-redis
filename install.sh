#!/bin/bash
if [ ! `id -u` -eq 0 ]; then
    echo 'need root'
    exit
fi

apk add --no-cache redis

mkdir -p /omo/data/redis
mkdir -p /omo/log

###################################
# Configurate Redis
###################################
cp -f ./redis/redis.conf /etc/redis.conf

redis-server /etc/redis.conf --daemonize yes

echo '!!! you need append follow code to /omo/.startup.sh'
echo 'redis-server /etc/redis.conf --daemonize yes'

