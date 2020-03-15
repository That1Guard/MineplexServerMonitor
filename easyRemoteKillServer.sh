#!/bin/sh
# author = memes#2030
# don't use on windows

# VARIABLES
serverAddress=$1
serverName=$2

pathToServer=../../serverName

# Stop the server
screen -S $serverName -X kill
screen -S $serverName -X quit

sleep 3

# Delete the server
rm -r -f $pathToServer