# author = memes#2030
# don't use on windows (you'll encounter a permission error (error code 1))
ping -c 1 $1 &> /dev/null && echo "Success" || echo "Failure"