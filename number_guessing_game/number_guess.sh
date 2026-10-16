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
  INSERT_USERNAME=$($PSQL "INSERT INTO score_board(username, games_played, best_game) VALUES('$USERNAME', 1, 0)")
else
  echo "$USERNAME_RESULT" | while read ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GAMES_PLAYED_NEW=$(($GAMES_PLAYED + 1))
    INSERT_GAMES_PLAYED=$($PSQL "UPDATE score_board SET games_played = $GAMES_PLAYED_NEW WHERE username = '$USERNAME'")
  done
fi

RANDOM_NUM=$(($MIN + $RANDOM % $MAX))
#echo "$RANDOM_NUM"

echo "Guess the secret number between 1 and 1000:"
read GUESS
GUESS_NUM=1

REGEX_CHK='[^0-9]'

while [[ $GUESS != $RANDOM_NUM ]]
do
  if [[ -z $GUESS || $GUESS =~ $REGEX_CHK ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS > $RANDOM_NUM ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS < $RANDOM_NUM ]]
  then
    echo "It's higher than that, guess again:"
  fi 
  read GUESS
  GUESS_NUM=$(($GUESS_NUM + 1))
done

echo "You guessed it in $GUESS_NUM tries. The secret number was $RANDOM_NUM. Nice job!"
if [[ $GUESS_NUM < $BEST_GAME ]]
then
  INSERT_BEST_GAME=$($PSQL "UPDATE score_board SET best_game = $GUESS_NUM")
fi
