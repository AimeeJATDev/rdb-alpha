#!/bin/bash
#Bingo Number Generator

NUMBER=$((RANDOM % 15 + 1))
TEXT="The next number is, "

echo -e "\n~~ Bingo Number Generator ~~\n" 

if (( $NUMBER <= 15 ))
then
  echo $TEXT B:$NUMBER
fi