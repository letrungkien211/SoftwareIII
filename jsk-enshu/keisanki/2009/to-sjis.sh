#!/bin/sh
while [ -n "$1" ]; do
	if [ -e "$1" ]; then
		nkf --windows $1 > $1.sjis
	fi
	shift
done
