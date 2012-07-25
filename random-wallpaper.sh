#! /bin/bash

files=`find ~/wallpapers/flam3 -name '*.jpg' -o -name '*.jpeg' -o -name '*.png'`
IFS='
'

count=0
for file in $files
do
    count=$(($count + 1))
done

select=$(($RANDOM % $count))
i=0
for file in $files
do
    if [ $i -eq $select ] ; then
	echo Setting "$file"
        feh --bg-scale "$file"
	exit 0
    fi
    i=$(($i + 1))
done
