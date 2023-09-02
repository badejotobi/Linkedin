#!/bin/bash

echo "USER creation"
echo "----------------How many user do you want to create--------"
read input

for((i =0; i < $input; i++))
do
	echo "enter the username"
	read user
	echo "$(sudo useradd -m $user)"
	echo " enter your password"
	echo "$(sudo passwd $user)"
	echo Changing the Bash Shell to bin/bash
	echo "$(sudo chsh -s /bin/bash $user)"
	echo "$(sudo chage -m 0 -M 7 -W 7 $user)"
	echo $user >> index.txt
	echo "$(sort index.txt)" > index.txt
  	echo "$(aws s3 cp index.txt s3://<bucketname>)"
done
echo "you have created $input usernames:"

