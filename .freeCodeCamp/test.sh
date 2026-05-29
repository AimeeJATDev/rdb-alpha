#!/bin/bash
#Bingo Number Generator

NUMBER=$((RANDOM % 15+16))
TEXT="The next number is, "

echo -e "\n~~ Bingo Number Generator ~~\n" 

if (( $NUMBER <= 15 ))
then
  echo $TEXT B:$NUMBER
elif [[ $NUMBER -le 30 ]]
then
  echo $TEXT I:$NUMBER
fi