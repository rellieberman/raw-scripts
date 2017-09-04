#!bin/bash

#script to extract jpg from raw image using dcraw and display it with xviewer
#currently only works with .RW2 files and xviewer
#needs dcraw to be installed

#Script makes a folder in tmp wich will be used to extract all the imbeded images to.
#After the extraction the file that was cliked on ($1) will be oppend.
#At the end of execution temp directory is removed.


mkdir /tmp/open_raw

TMPFILE=`mktemp /tmp/open_raw/example.XXXXXXXXXX` || exit 1

dcraw -c -e "$1" > $TMPFILE

for f in *.RW2
do 
    echo "loop for $f"
    LOOPFILE=`mktemp /tmp/open_raw/example.XXXXXXXXXX` || exit 1
    dcraw -c -e "$f" > $LOOPFILE
done

xviewer $TMPFILE

rmdir -rf /tmp/open_raw

