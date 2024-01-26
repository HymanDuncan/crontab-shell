#!/bin/sh
if ! ps -ef | grep "tcpcopy" | grep -v "grep" > /dev/null;
         then
        /usr/local/tcpcopy/sbin/tcpcopy -l /var/log/tcpcopy.log -x 11111-192.168.8.11:11112 -s 192.168.8.11 -c 192.168.244.44 &
    echo "tcpcopy started!"
else
    echo "tcpcopy already started!"
fi
while true;
    do
    if ! ps -ef | grep "tcpcopy" | grep -v "grep" > /dev/null;
    then
        /usr/local/tcpcopy/sbin/tcpcopy -l /var/log/tcpcopy.log -x 11111-192.168.8.11:11112 -s 192.168.8.11 -c 192.168.244.44 &
    echo "tcpcopy restart success!"
    fi
    sleep 10
done

