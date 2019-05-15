#/bin/bash

path="/proc"

function help()
{
	echo -e "q - Exit Process\nh - Help\nk - kill <pid> to kill process"
}

function key()
{
	while read -N 1 -t 0.001 button;do
		if [[ $button == q ]];then
			exit
		elif [[ $button == h ]];then
			help
			echo -n "Press c to continue: "
			read c
		elif [[ $button == r ]];then
			read 
		elif [[ $button == k ]];then
			echo -n "Enter pid to kill: "
			read p
			kill -9 $p
			echo "$p killed"
			sleep 2
		fi
	done
}

function header()
{

	echo -n "top: "; cat /proc/uptime ; echo -n "load average: "; cat  /proc/loadavg
	awk '/MemTotal/ {printf $1 " " $2"\t"}' /proc/meminfo	
	awk '/MemFree/ {printf  $1 " " $2"\t"}' /proc/meminfo	
	awk '/Buffers/ {print $1 " " $2""}' /proc/meminfo
	awk '/SwapTotal/ {printf $1 " " $2"\t"}' /proc/meminfo
	awk '/SwapFree/ {print $1 " " $2"\t"}' /proc/meminfo
	awk '/procs_running/ {print "running: " $2"\t"}' /proc/stat
	
	
	text=`tput setaf 53`
	background=`tput setab 7`
	reset=`tput sgr 0` 
	echo -e "${text}${background}PID\tPPID\tS\tPR\tN\tUSER\t\t\tTIME\t\t\t%CPU\tCOMM${reset}"
}
function procList()
{
	clear
	header
	for i in `ls $path`; do
			key		
		if [[ -d $path/$i && $path/$i =~ [0-9]$ ]];then
		sfile=/proc/$i/stat
		proctime=$(cat $sfile|awk '{print "\t" $14}')
		totaltime=$(grep '^cpu ' /proc/stat |awk '{sum=$2+$3+$4+$5+$6+$7+$8+$9+$10; print "\t" sum}')
		awk '/^Pid/ {printf " " $2} ' $path/$i/status
		awk '/^PPid/ {printf "\t" $2} ' $path/$i/status 
		awk '/State/ {printf "\t" $2 } ' $path/$i/status
		awk '{printf "\t" $18}' $path/$i/stat
		awk '{printf "\t" $19 "\t"}' $path/$i/stat
		user=`ls -l /proc/ | grep " $i$" | awk {'print"\t"$4'}`
		echo -en $user "\t\t"
		prevproctime=$proctime
	    prevtotaltime=$totaltime
		proctime=$(cat $sfile|awk '{printf "\t" $14}')
		totaltime=$(grep '^cpu ' /proc/stat | awk '{sum=$2+$3+$4+$5+$6+$7+$8+$9+$10; printf "\t" sum}')
		ratio=$(echo "scale=2;($proctime - $prevproctime) / ($totaltime - $prevtotaltime)"|bc -l)
	    echo -n "$(date --rfc-3339=seconds);       $(echo "$ratio*100.0"|bc -l)"
		awk ' {print "\t" $1 }' $path/$i/comm
		elif [[ $path/$i =~ [a-z]$ ]];then
			continue
		fi 
	done 
	sleep 2
	clear
	procList 
}

procList
