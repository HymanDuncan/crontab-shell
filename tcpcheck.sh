#!/bin/sh
if ! ps -ef | grep "tcpcopy" | grep -v "grep" > /dev/null;
         then
        /usr/local/tcpcopy/sbin/tcpcopy -l /var/log/tcpcopy.log -x 11111-192.168.8.11:11112 -s 192.168.8.11 -c 192.168.244.44 &
    echo "tcpcopy started! $(date +%T)"
else
    echo "tcpcopy already started! $(date +%T)"
fi
while true;
    do
    if ! ps -ef | grep "tcpcopy" | grep -v "grep" > /dev/null;
    then
        /usr/local/tcpcopy/sbin/tcpcopy -l /var/log/tcpcopy.log -x 11111-192.168.8.11:11112 -s 192.168.8.11 -c 192.168.244.44 &
    echo "tcpcopy restart success! $(date +%T)"
    fi
    sleep 10
done

