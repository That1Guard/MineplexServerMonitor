# Mineplex Server Monitor Shell Scripts

## Depends
* Shell Script knowledge
* Linux or Mac (Windows Linux Subsystems should work)

## Setup
* Change [easyRemoteStartServerCustom.sh](easyRemoteStartServerCustom.sh) line ```23``` (```pathToServer```) and [easyRemoteKillServer.sh](easyRemoteKillServer.sh) line ```8``` (```pathToServer```) to be the path from the script directory to where your servers are located. Make sure to add the ```$serverName``` at the end.
* Change [easyRemoteStartServerCustom.sh](easyRemoteStartServerCustom.sh) line ```24``` (```pathToJars```) to be the path to where your jar files are. These jar files are things like ```craftbukkit.jar```, ```Hub.jar```, ```Arcade.jar```, ```NoCheatPlus.jar```, and there's an option for ```WorldEdit.jar```
* Change the script locations in the Server Monitor to point to where ever you put these scripts
* Have at least one dedicated server listed in your redis (see [this](https://gist.github.com/randomdevlol/5b36bdf0972b66d9ed6059b786d78d5a))
* If your dedicated server isn't the one running the Server Monitor, go into [easyRemoteStartServerCustom](easyRemoteStartServerCustom.sh) and [easyRemoteKillServer](easyRemoteKillServer.sh) and edit the script to run the commands in SSH. I won't provide support on tbis.
* Compile the Server Monitor and run it like a normal java app
* You should be all set

## Trouble shooting
* ***Cannot make directory '/var/run/screen': Permission denied:*** Run ```sudo /etc/init.d/screen-cleanup start```

## Authors
* OnlyJoking/randomdevlol - Main contributor & Project Manager

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details