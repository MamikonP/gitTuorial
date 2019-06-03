#!/bin/bash
users=("student" "dlink" "lenovo")
passwords=("dlink123" "armavia2019" "dlink")
ip=("192.168.0.157" "192.168.0.141" "192.168.0.45")
function net {
for (( i = 0; i < ${#users[@]}; i++ )) 
do
	if [[ $1 == student ]] && [[ $2 == dlink123 ]] && [[ $3 == "192.168.0.157" ]]
	then
		users[i]=$1
		passwords[i]=$2
		ip[i]=$3
		ssh ${users[i]}@$ip
		break

	elif [[ $1 == dlink ]] && [[ $2 == dlink ]] && [[ $3 == "192.168.0.141" ]]
	then
		users[i]=$1
		passwords[i]=$2
		ip[i]=$3
		ssh ${users[i]}@$ip
		break

	elif [[ $1 == lenovo ]] && [[ $2 == "armavia2019" ]] && [[ $3 == "192.168.0.45" ]]
	then
		users[i]=$1
		passwords[i]=$2
		ip[i]=$3
		ssh ${users[i]}@$ip
		break

	else 
		echo "Wrong username / password / ip"
		break
	fi
done
}

net $1 $2 $3
