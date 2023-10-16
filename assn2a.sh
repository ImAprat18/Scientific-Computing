#!/usr/bin/bash

usernum="$1"
lastdig=$2+2
if [ ! -z $usernum ] && [ ! -z $2 ];then 
	if [ $2 -lt 200 ] || [ $2 -eq 200 ] && [ $2 -gt 0 ];then
		sage -c "i=$1.n(digits=$lastdig); i_str=str(i); print(i_str[$lastdig - 1])"
	else
		echo "Please enter a positive integer less than or equal to 200!"
	fi
else
	echo "Please enter two arguments!"
fi 
