# author = memes#2030
# don't use on windows

# VARIABLES
# serverAddress = $1
# serverName = $2

pathToServer = ../../$2

# Stop the server
screen -S $2 -X 'echo stop'

sleep 3

# Delete the server
rm -r -f $pathToServer