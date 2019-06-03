#/bin/bash
function param() {
if [[ $# != 1 ]];then
	echo Does exist 1 argument 
	exit 0
fi

if [[ $1 -lt 2 ]];then
	echo The parameter does have minimum 2
	exit 1
	else 
		return 0
fi
}

param $1

for (( i = 0; i < $1; i++ ));do
	for (( j=0; j <= $i; j++ ));do
		echo -n "*"
	done
	echo
done

echo

for (( i=$1; i > 0; i-- ));do
	for (( j=$i; j > 0 ; --j )) ;do
		echo -n " "
	done
	for (( k=$1; k > $i-1; k-- )) ;do
		echo -n "*"
	done
	echo 
done

echo

for (( i=0; i < $1; i++ ));do
	for (( j=$i; j < $1; j++ ));do
		echo -n "*"
	done	
	echo 
done

echo

for (( i=$1; i > 0; --i ));do
	for (( j=$i; j > 0; --j ));do
		echo -n "*"
	done
	echo
	for (( k = $1; k > $i - 1; k-- )); do 
		echo -n " "
	done
done
