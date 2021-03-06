#!/bin/dash

for filename in "$@"
do
    echo new files coming ...
    if test -r "$new_filename"
    then
        echo "new file exists"
    fi
done
