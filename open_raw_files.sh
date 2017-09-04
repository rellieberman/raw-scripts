#!bin/bash

#script to extract jpg from raw image using dcraw and display it with xviewer
#currently only works with .RW2 files and xviewer
#needs dcraw to be installed

#Script makes a folder in tmp wich will be used to extract all the imbeded images to.
#After the extraction the file that was cliked on ($1) will be oppend.
#At the end of execution temp directory is removed.

#Crate variable that will keep files in order
COUNT=1

DIRECT=$( dirname "$1" )

cd "$DIRECT"

mkdir /tmp/open_raw 

TMPFILE=`mktemp /tmp/open_raw/clicked.XXXXXXXXXX` || exit 1

dcraw -c -e "$1" > $TMPFILE

for f in *.RW2
do 
    LOOPFILE=$( mktemp "/tmp/open_raw/$COUNT.XXXXXXXXXX" || exit 1 )
    dcraw -c -e "$f" > $LOOPFILE
    COUNT=$(( COUNT + 1 ))
done

xviewer $TMPFILE

#remove tmp files

for i in /tmp/open_raw/*.tmp
do
    rm $i
done

rmdir  /tmp/open_raw

