#!bin/bash

#script to extract jpg from raw image using dcraw and display it with xviewer

echo "file that will be opened: $1"

pwd

mkdir /tmp/open_raw

TMPFILE=`mktemp /tmp/open_raw/example.XXXXXXXXXX` || exit 1

echo "made tmp folder and file"

dcraw -c -e "$1" > $TMPFILE

for f in *.RW2
do 
    echo "loop for $f"
    LOOPFILE=`mktemp /tmp/open_raw/example.XXXXXXXXXX` || exit 1
    dcraw -c -e "$f" > $LOOPFILE
done

xviewer $TMPFILE

echo $TMPFILE

rmdir -rf /tmp/open_raw

