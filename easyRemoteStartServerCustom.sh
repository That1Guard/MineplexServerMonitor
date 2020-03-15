#!/bin/sh
# author = memes#2030

if [ $(uname -s) != "Darwin" ] && [ $(uname -s) != "Linux" ]; then
    echo "WARNING! Either you're using some weird os or you're using windows. It's recommended you use MacOS or Linux!"
    exit
fi

# Variables
serverAddress=$1
privateAddress=$2
port=$3
ram=$4
world=$5
plugin=$6
configPath=$7
serverGroup=$8
serverName=$9
isInUS=${10}
addNoCheat=${11}
addWorldEdit=${12}

pathToServer=../../$serverName
pathToJars=../jars

# Delete the server folder if it already exists cause I'm lazy
if [ -d $pathToServer ]; then
    rm -r -f $pathToServer
fi

# Make the server directory
mkdir $pathToServer

# Make server.properties file and put the properties in the file
touch $pathToServer/server.properties
echo "server-port=$port" >> $pathToServer/server.properties

# Copy server jar into new directory
cp $pathToJars/craftbukkit.jar $pathToServer/

# Make the plugins folder
mkdir $pathToServer/plugins

# Copy the main plugin to the server (either Hub or Arcade)
cp $pathToJars/$plugin $pathToServer/plugins

# Check if we should add nocheatplus to the server
if [ "${addNoCheat}" = "true" ]; then
   cp $pathToJars/NoCheatPlus.jar $pathToServer/plugins
fi

# Check if we should add worldedit to the server
if [ "${addWorldEdit}" = "true" ]; then
   cp $pathToJars/WorldEdit.jar $pathToServer/plugins
fi

# Copy the world into the server
unzip ../worlds/$world -d $pathToServer/ > /dev/null

# Make the config file & edit it for the server group
mkdir $pathToServer/$configPath
touch $pathToServer/$configPath/config.yml
echo "serverstatus:" >> $pathToServer/$configPath/config.yml
echo "  group: $serverGroup" >> $pathToServer/$configPath/config.yml
echo "  name: $serverName" >> $pathToServer/$configPath/config.yml
echo "  us: $isInUS" >> $pathToServer/$configPath/config.yml
echo "  connectionurl: 127.0.0.1:3306" >> $pathToServer/$configPath/config.yml
echo "  username: mineplex" >> $pathToServer/$configPath/config.yml
echo "  password: mineplex" >> $pathToServer/$configPath/config.yml
echo "queue:" >> $pathToServer/$configPath/config.yml
echo "  us: $isInUS" >> $pathToServer/$configPath/config.yml

cd $pathToServer
screen -dmS $serverName
screen -S $serverName -X exec java -Xmx${ram}M -jar craftbukkit.jar

# Test command:
# ./easyRemoteStartServerCustom.sh 127.0.0.1 127.0.0.1 40000 500 lobby.zip Hub.jar plugins/Hub/ Lobby Lobby-1 true true true
