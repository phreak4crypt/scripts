#!/bin/bash

pcount=0
fcount=0

cd /home/user/workspace
if [ -f eval.class ]; then
    rm eval.class
fi

for d in /code/testcases/*; do
    cp $d/eval.java /home/user/workspace
    javac -cp .:/home/user/jars/* eval.java 
    java -cp .:/home/user/jars/* org.junit.runner.JUnitCore eval
    exit_status=$?
    if [ $exit_status -eq 0 ]; then
    	pcount=$((pcount+1))
    else
        fcount=$((fcount+1))
    fi
    echo -n $exit_status > $d/STATUS
    rm eval.class
done

echo "Number of passed testcases is: "$pcount
echo
echo "Number of failed testcases is: "$fcount

