#!/bin/bash

pcount=0
fcount=0
for d in /code/testcases/*; do
        cp $d/eval*.* test.py
        python3 test.py &>> $d/OUTPUT
        if [ $? -ne 0 ]; then
                fcount=$((fcount+1))
        else
                pcount=$((pcount+1))
        fi
        rm test.py
done
echo "Number of passed testcases is: "$pcount
echo
echo "Number of failed testcases is: "$fcount
