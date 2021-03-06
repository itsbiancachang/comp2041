#!/bin/dash

echo "hello double quote"
echo 'hi single quote'
echo without clothes today haha looking fresh

echo '"Dash makes you look beautiful tonight",  -  I love you'

for txt_file in *.txt
do
    echo $txt_file
done
