#!/bin/bash

find_file() {
    file_name=$1
    if [ -z $2 ]; then		
        dir_path=`pwd`		
    else				
        dir_path=$2		
		cd $2			
						
    fi

    for file in `ls $dir_path`; do

        if [ -e $file ] && [ ! -d $file ]; then	
            if [ $file == $file_name ]; then	
                echo "`pwd`/$file : file"		
            fi									

        elif [ -d $file ]; then					
			if [ $file == $file_name ]; then	
                echo "`pwd`/$file : directory"	
            fi								
			cd $file							
			find_file $1						
		fi										
    done
	cd ..

}

if [ $# == 0 ]; then  							
	echo "`basename $0` options (-f, -d, -h)" 
    exit 0
fi								

while getopts ":d:f:h" option; do
case $option in
	d)D_ARG=$OPTARG;;
	f)F_ARG=$OPTARG;;
	h)echo ""
	  echo "	`basename $0` - search for files."
	  echo ""
	  echo "OPTIONS:"
	  echo "-h : help (with no argument)."									
	  echo "-f : takes the name of the file, as an argument."
	  echo "-d : takes the path of the directory when the file can be, as an argument." 
      exit 0;;
	*)echo "This otion does not exist.";;
esac
done

if [ -n $D_ARG ]; then	
	find_file $F_ARG $D_ARG	
else					
	find_file $F_ARG
fi				
