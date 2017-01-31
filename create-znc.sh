#!/bin/bash
LASTPORT=`cat ~/.port`
PORT=$(($LASTPORT+1))

if (( "$#" != 1 )) 
then
    echo "Usage Info: ./create-znc.sh USERNAME"
exit 1
fi

echo $PORT > ~/.port
echo "Creating new ZNC Instance for $1 on Port: $PORT"
docker run --name $1-$PORT -d -p $PORT:9090 -v $HOME/$1/.znc:/znc-data dkuntz/znc-cufflink
