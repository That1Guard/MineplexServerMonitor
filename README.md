# Mineplex Server Monitor Shell Scripts

## Depends
* Shell Script knowledge
* Linux or Mac (Windows Linux Subsystems should work)

## Setup
* Change [easyRemoteStartServerCustom.sh](easyRemoteStartServerCustom.sh) line ```26``` (```pathToServer```) and [easyRemoteKillServer.sh](easyRemoteKillServer.sh) line ```8``` (```pathToServer```) to be the path from the script directory to where your servers are located. Make sure to add the ```$9``` at the end.
* Change [easyRemoteStartServerCustom.sh](easyRemoteStartServerCustom.sh) line ```27``` (```pathToJars```) to be the path to where your jar files are. These jar files are things like ```craftbukkit.jar```, ```Hub.jar```, ```Arcade.jar```, ```NoCheatPlus.jar```, and there's an option for ```WorldEdit.jar```
* If you aren't using [my web api](https://github.com/randomdevlol/mineplexnodejs) for running your source, change line ```98``` in [easyRemoteStartServerCustom.sh](easyRemoteStartServerCustom.sh) to match your web server's url
* Go into your Server Monitor source and change the paths to the shell scripts to where ever you cloned your scripts to be at.
* Compile the Server Monitor and run it like a normal java app
* You should be all set!

## Trouble shooting
* ***Cannot make directory '/var/run/screen': Permission denied:*** Run ```sudo /etc/init.d/screen-cleanup start```

## Authors
* OnlyJoking/randomdevlol - Main contributor & Project Manager

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details