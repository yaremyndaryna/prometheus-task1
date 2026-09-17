#!/bin/bash

answer=0

function print() {
  echo -e "Value $1 $2 set"
}

#If yml file is
if [ -f $studentFile ];
then
    IFS=';'
    while read line; do
        read -a arr <<< "$line"
        echo ${arr[1]}
        if [[ $(yq "${arr[0]}" $2) == "${arr[1]}" ]]
        then
            print ${arr[1]} "was"
            ((answer=answer+1))
        else
            print ${arr[1]} "was not"
        fi
    done < $1
    
    
    if [ $answer != 6 ];
        then
        echo "You have $answer correct answer. Should be 6 passed tests"
        exit 1
    fi
else
    echo "You did not push file $2"
    exit 1
fi
