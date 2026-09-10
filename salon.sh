#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~~ Welcome to the Salon ~~~~~~\n"

MAIN_MENU() {
if [[ $1 ]]
then
  echo -e "\n$1"
fi

echo "How may we help you today?"
SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

echo "$SERVICES" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

read CHOSEN_SERVICE
if [[ ! $CHOSEN_SERVICE =~ ^[0-9]+$ ]] 
then
  MAIN_MENU "Please choose a valid service."
fi

CHOOSE_SERVICE=$($PSQL "SELECT * FROM services WHERE service_id = '$CHOSEN_SERVICE'")
if [[ -z $CHOOSE_SERVICE ]]
then
  MAIN_MENU "Please choose a valid service."
fi
 
 CREATE_APPOINTMENT
}

CREATE_APPOINTMENT() {
 echo "appointment $CHOSEN_SERVICE created"
}

MAIN_MENU