#! /bin/sh

echo "autocommit ver0.1 start"

Dir="/autocommit"
FILE=".statistics_check"

echo $Dir/$FILE

if [  "$?" = "0" ]; then

	if [ ! -e $Dir/$FILE ]; then
		echo "1" >> $Dir/$FILE
	fi
	
	state=$(cat $Dir/$FILE)
	plus=`expr $state + 1`
	sed -i "s/$state/$plus/g" $Dir/$FILE	

	cd $Dir
	git add .
	git commit -m "Day $plus"
	git push origin master

	echo "success"

else

    echo "fail"
    exit 1
fi