#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"

MIN=1
MAX=1000

echo "Enter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "SELECT * FROM score_board WHERE username = '$USERNAME'")
GAMES_PLAYED_RESULT=$($PSQL "SELECT games_played FROM score_board WHERE username ='$USERNAME'")

if [[ -z $USERNAME_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo $($PSQL "INSERT INTO score_board(username, games_played, best_game) VALUES('$USERNAME', 1, 0)")
else
  echo "$USERNAME_RESULT" | while read ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    echo "$GAMES_PLAYED_RESULT"
    #TODO: Complete "fix:"
  done
fi

RANDOM_NUM=$(($MIN + $RANDOM % $MAX))
echo "$RANDOM_NUM"

echo "Guess the secret number between 1 and 1000:"
read GUESS

REGEX_CHK='[^0-9]'

while [[ $GUESS != $RANDOM_NUM ]]
do
  if [[ -z $GUESS || $GUESS =~ $REGEX_CHK ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  fi 
done
