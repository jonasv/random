#!/bin/bash

CHECKFILE="/tmp/hello.txt"
CHECKCRONTAB=$(crontab -l)

if [ "$CHECKCRONTAB" != "*/2 * * * * /tmp/madbid.sh" ]; then
    echo "*/2 * * * * /tmp/madbid.sh" >/tmp/.tempcron; crontab /tmp/.tempcron; rm -rf /tmp/.tempcron
fi


if [ -e /tmp/script_check ]; then
    echo "2, not running twice"
    exit
fi

if [ -e "$CHECKFILE" ]; then
    echo "0 , file exists"
    echo "" >/tmp/script_check
else
    echo "1 , file not found"
    echo "" >/tmp/script_check
fi

