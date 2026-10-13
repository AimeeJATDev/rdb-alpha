#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"

MIN=1
MAX=1000

echo "Enter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "SELECT * FROM score_board WHERE username = '$USERNAME'")

if [[ -z $USERNAME_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo $($PSQL "INSERT INTO score_board(username) VALUES('$USERNAME')")
else
  echo "$USERNAME_RESULT" | while read ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi