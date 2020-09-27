#!/bin/bash

pcount=0
fcount=0

cd /home/user/workspace
if [ -f eval.class ]; then
    rm eval.class
fi

for d in /code/testcases/*; do
    mv $d/eval.java /home/user/workspace
    javac -cp .:/home/user/jars/* eval.java 
    java -cp .:/home/user/jars/* org.junit.runner.JUnitCore eval  &> temp
    if [ $? -ne 0 ]; then
    	fcount=$((fcount+1))
	else
	    pcount=$((pcount+1))
	fi
    echo -n $exit_status > $d/STATUS
    rm eval.class
    rm temp
done

echo "Number of passed testcases is: "$pcount
echo
echo "Number of failed testcases is: "$fcount
