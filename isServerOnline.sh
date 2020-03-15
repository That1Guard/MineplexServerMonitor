#!/bin/sh
# author = memes#2030
ping -c 1 $1 &> /dev/null && echo "Success" || echo "Failure"