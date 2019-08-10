#!/bin/ash
htpasswd -b -c /etc/nginx/rtorrent.auth ${USER} ${PASS}
nginx &
P1=$!
rtorrent &
P2=$!
wait $P1 $P2
