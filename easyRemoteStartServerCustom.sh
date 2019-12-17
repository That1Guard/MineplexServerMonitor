#!/bin/sh

# author = memes#2030
# don't use on windows, this script uses screen which is a command only available for linux distros and macs (since they're UNIX systems, windows isn't)
# no running this script in git bash doesn't let you use the screen command 
# if you do have the linux subsystem installed though that should work

#VARIABLES
# $SERVERADDRESS = $1
# $privateAddress = $2
# $port = $3
# ram = $4
# world = $5
# plugin = $6
# configPath = $7
# name = $8
# serverName = $9
# isInUS = ${10}
# noCheatEnabled = ${11}
# addWorldEdit = ${12}

# if [ $(uname -s) != "Darwin" ] && [ $(uname -s) != "Linux" ]; then
#     echo "WARNING! Either you're using some weird os or you're using windows. It's recommended you use MacOS or Linux!"
# fi

pathToServer=../../$9

# Make the server directory
mkdir $pathToServer

# Make server.properties file and put the properties in the file
# TODO: find a better and more efficient way of doing this
touch $pathToServer/server.properties

echo "view-distance=10" > $pathToServer/server.properties
echo "server-ip=$1" >> $pathToServer/server.properties
echo "level-seed=" >> $pathToServer/server.properties
echo "allow-nether=false" >> $pathToServer/server.properties
echo "enable-command-block=false" >> $pathToServer/server.properties
echo "server-port=$3" >> $pathToServer/server.properties
echo "gamemode=0" >> $pathToServer/server.properties
echo "enable-rcon=false" >> $pathToServer/server.properties
echo "op-permission-level=4" >> $pathToServer/server.properties
echo "enable-query=false" >> $pathToServer/server.properties
echo "generator-settings=" >> $pathToServer/server.properties
echo "resource-pack=" >> $pathToServer/server.properties
echo "player-idle-timeout=" >> $pathToServer/server.properties
echo "level-name=world" >> $pathToServer/server.properties
echo "motd=A Minecraft Server" >> $pathToServer/server.properties
echo "announce-player-achievement=false" >> $pathToServer/server.properties
echo "force-gamemode=false" >> $pathToServer/server.properties
echo "hardcore=false" >> $pathToServer/server.properties
echo "white-list=false" >> $pathToServer/server.properties
echo "pvp=true" >> $pathToServer/server.properties
echo "spawn-npcs=true" >> $pathToServer/server.properties
echo "generate-structures=true" >> $pathToServer/server.properties
echo "spawn-animals=true" >> $pathToServer/server.properties
echo "snooper-enabled=false" >> $pathToServer/server.properties
echo "difficulty=1" >> $pathToServer/server.properties
echo "level-type=DEFAULT" >> $pathToServer/server.properties
echo "spawn-monsters=true" >> $pathToServer/server.properties
echo "max-players=20" >> $pathToServer/server.properties
echo "spawn-protection=16" >> $pathToServer/server.properties
echo "online-mode=false" >> $pathToServer/server.properties # offline for bungeecord
echo "allow-flight=false" >> $pathToServer/server.properties

# Copy server jar into new directory
cp ../plugins/craftbukkit.jar $pathToServer/

# Make the plugins folder
mkdir $pathToServer/plugins

# Copy the main plugin to the server (either Hub or Arcade)
cp ../plugins/$6 $pathToServer/plugins

# Check if we should add nocheatplus to the server
if [ "${11}" = "true" ]; then
   cp ../plugins/NoCheatPlus.jar $pathToServer/plugins
fi

# Check if we should add worldedit to the server
if [ "${12}" = "true" ]; then
   cp ../plugins/WorldEdit.jar $pathToServer/plugins
fi

# Copy the world into the server
if [ "$5" = "world" ]; then
    cp -r ../maps/Lobby/world $pathToServer/
fi

# Make the config file & edit it for the server group
mkdir $pathToServer/$7
touch $pathToServer/$7/config.yml
echo "webServer: http://127.0.0.1:8080" >> $pathToServer/$7config.yml
echo "serverstatus:" >> $pathToServer/$7config.yml
echo "  group: $8" >> $pathToServer/$7config.yml
echo "  name: $9" >> $pathToServer/$7config.yml
echo "  us: ${10}" >> $pathToServer/$7config.yml
echo "  connectionurl: 127.0.0.1:3306" >> $pathToServer/$7config.yml
echo "  username: mineplex" >> $pathToServer/$7config.yml
echo "  password: mineplex" >> $pathToServer/$7config.yml
echo "queue:" >> $pathToServer/$7config.yml
echo "  us: ${10}" >> $pathToServer/$7config.yml

# Start the server (thanks stackoverflow https://stackoverflow.com/questions/22263204/screen-x-isnt-working-no-screen-found)
sudo su - root -c "script -c screen /dev/null /bin/bash cd $pathToServer | java -Xmx$4M -jar craftbukkit.jar"
# ./easyRemoteStartServerCustom.sh 1.1.1.1 1.1.1.1 40000 500 world Hub.jar plugins/Hub/ Test Test-1 true true true
