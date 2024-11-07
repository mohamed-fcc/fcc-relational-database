#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~"

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

SHOW_SERVICES() {
  # get all services from db
  MY_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  # if no services found
  if [[ -z $MY_SERVICES ]]
  then
    echo -e "\nSorry, we don't have any service available for now."
  else 
    # show the available services
    echo -e "\nWelcome to My Salon, how can I help you?"
    echo "$MY_SERVICES" | while IFS="|" read SERVICE_ID NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    read SERVICE_ID_SELECTED

    # if the entered value is not a number
    if [[ ! $SERVICE_ID_SELECTED  =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not a valid service number."
      SHOW_SERVICES
    else
      SELECT_SERVICE $SERVICE_ID_SELECTED
    fi
  fi
}

SELECT_SERVICE() {
  
  SERVICE_ID_SELECTED=$1
  # get the service's name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # if service not found
  if [[ -z $SERVICE_NAME ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    SHOW_SERVICES
  else
    # get customer's phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # get customer's name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # if customer not found
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get customer's name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi

    # get customer's id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # get the appointment time
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # insert the appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
    fi
     
  fi
}

SHOW_SERVICES
