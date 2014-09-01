#!/bin/bash

#dir1
DIR1=$1
DIR2=$2

if [ $DIR1 = '' ]  ||  [ $DIR2 = '' ]
then 
    echo "Usage : diffDir PATH1 PATH2"
    return
fi
BASENAME1=`basename $DIR1`
BASENAME2=`basename $DIR2`
RESULT_DIR="./cmp_result"
if [ -e $DIR1 ] && [ -e $DIR2 ]
then 
    mkdir -p $RESULT_DIR
    FILES=$DIR1/*
    for f in $FILES
    do
    # if both are files, not folders, then compare them
    FILENAME=`basename $f`
    F2=$DIR2/$FILENAME
    if [ -f $F2 ] && [ -f $f ]
    then 
	echo "Comparing $FILENAME "
	diff $f $F2 > "$RESULT_DIR/$FILENAME"
	echo "Done. Results are stored in $FILENAME"
    fi
    done
fi

















