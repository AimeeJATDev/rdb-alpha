#!/bin/bash
#Bingo Number Generator

NUMBER=$((RANDOM % 75 + 1))
TEXT="The next number is, "

echo -e "\n~~ Bingo Number Generator ~~\n"

echo $NUMBER

echo $TEXT