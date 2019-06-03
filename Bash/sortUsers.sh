#!/bin/bash

arrname=(one four two three)
arrpass=(four one three two)

server="10.15.4.15"

function net {
for (( i = 0; i < ${#arrname[@]}; i++ )) 
do
	if [[ $1 == one ]] && [[ $2 == one ]]
	then
		arrname[i]=$1
		ssh ${arrname[i]}@$server
		break

	elif [[ $1 == two ]] && [[ $2 == one ]]
	then
		arrname[i]=$1
		ssh ${arrname[i]}@$server
		break

	elif [[ $1 == three ]] && [[ $2 == one ]]
	then
		arrname[i]=$1
		ssh ${arrname[i]}@$server
		break

	elif [[ $1 == four ]] && [[ $2 == one ]]
	then
		arrname[i]=$1
		ssh ${arrname[i]}@$server
		break

	else 
		echo "Wrong username or password"
		break
	fi
done
}

net $1 $2
