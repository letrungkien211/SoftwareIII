#!/bin/sh
while [ -n "$1" ]; do
	if [ -e "$1" ]; then
		nkf $1 > $1.jis
	fi
	shift
done
