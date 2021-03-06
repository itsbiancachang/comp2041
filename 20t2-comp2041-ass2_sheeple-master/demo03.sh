#!/bin/dash



if [ "$1" -eq "$2" ]
then
    echo this is correct
elif [ "$1" -ne "$2"]
    echo this is not correct
else
    echo "assume we only compare string for now, re-enter"
fi

