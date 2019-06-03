#!/bin/bash

function myfunc {
    mkdir ~/Desktop/reserveCopy
    cd ~/Desktop/newfolder/
    cp -rf * ~/Desktop/reserveCopy
    cd ~/Desktop/reserveCopy
	
    for filename in *; do
            mv "$filename" "$filename.bckp"; 
    done

	touch ~/Desktop/reserveCopy/dateFile
	variable=`date`
	echo $variable >> ~/Desktop/reserveCopy/dateFile
} 

myfunc
  

