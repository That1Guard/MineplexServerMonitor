# Mineplex Server Monitor Shell Scripts
These are experimental and are not currently working.

## Depends
* Shell Script knowledge
* Linux or Mac (Windows Linux Subsystems should work)

## Setup
* Go into [easyRemoteStartServerCustom.sh](easyRemoteStartServerCustom.sh) and change ```pathToServer``` to the path to where your servers are w/ the ```$9``` at the end.
* Within lines 68-89 change the paths to the plugins as well as the maps.
* Go into [easyRemoteKillServer.sh](easyRemoteKillServer.sh) and change ```pathToServer``` to the path to where your servers are w/ the ```$2``` at the end.
* Go into your Server Monitor source and change the paths to the shell scripts to where ever you cloned your scripts to be at.
* Compile the Server Monitor and run it like a normal java app
* You should be all set!

## Todo
For a list of the things that are still needing to be done, look [here](TODO.md). All help is appreciated.

## Trouble shooting
* ***Cannot make directory '/var/run/screen': Permission denied:*** Run ```sudo /etc/init.d/screen-cleanup start```

## Authors
* OnlyJoking/randomdevlol - Main contributor & Project Manager

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details