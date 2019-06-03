#!/bin/bash

#This will be have a parameter

function myprime () {
	for(( i = 2; i < $1; i++ ))
	do
		for (( j = 2; j < $i; j++ ))
		do
			if [ $(($i % $j)) == 0 ]
			then
				break
			elif [ $i == $(($j+1)) ]
			then
				echo -n $i " "
			fi
		done
	done
}

myprime $1
