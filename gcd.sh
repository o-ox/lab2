#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'
GREEN='\033[1;32m'

echo -n Введите a:
read a
echo -n Введите b: 
read b

while [ $b -ne 0 ]; do
	let "a_ = b"
	let "b = a % b"
	let "a = a_"
done

echo -e "$GREEN"НОД: $a"$NC"