#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~~ Welcome to the Salon ~~~~~~\n"

MAIN_MENU() {

echo "How may we help you today?"
SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

echo "$SERVICES" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

}

MAIN_MENU