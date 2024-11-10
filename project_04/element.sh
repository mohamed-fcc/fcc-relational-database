#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

GET_ELEMENT_BY_ATOMIC_NUMBER() {
  # if no atomic number was provided
  if [[ ! $1 ]]
  then
    echo -e "\n\nPlease provide a valid atomic number."
  else
    # get element details by its atomic number
    ELEMENT_DETAILS=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements as e INNER JOIN properties as p USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE atomic_number=$ELEMENT")
    # if no element found
    if [[ -z $ELEMENT_DETAILS ]]
    then
      echo I could not find that element in the database.
    else
      # show the message
      SHOW_MESSAGE "$ELEMENT_DETAILS"
    fi
  fi
}

GET_ELEMENT_BY_SYMBOL() {
  # if no symbol was provided
  if [[ ! $1 ]]
  then
    echo -e "\n\nPlease provide a valid symbol."
  else
    # get element details by its symbol
    ELEMENT_DETAILS=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements as e INNER JOIN properties as p USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE e.symbol ilike '$ELEMENT'")
    # if no element found
    if [[ -z $ELEMENT_DETAILS ]]
    then
      echo I could not find that element in the database.
    else
      # show the message
      SHOW_MESSAGE "$ELEMENT_DETAILS"
    fi
  fi
}

GET_ELEMENT_BY_NAME() {
  # if no name was provided
  if [[ ! $1 ]]
  then
    echo -e "\n\nPlease provide a valid name."
  else
    # get element details by its name
    ELEMENT_DETAILS=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements as e INNER JOIN properties as p USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE e.name ilike '$ELEMENT'")
    # if no element found
    if [[ -z $ELEMENT_DETAILS ]]
    then
      echo I could not find that element in the database.
    else
      # show the message
      SHOW_MESSAGE "$ELEMENT_DETAILS"
    fi
  fi
}

MAIN() {

  ELEMENT=$1

  # if it's and atomic number
  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then
    # get the element by its atomic number
    GET_ELEMENT_BY_ATOMIC_NUMBER "$ELEMENT"
  # if it's an element symbol
  elif [[ $ELEMENT =~ ^[A-Za-z]{1,2}$ ]]
  then
    # get the element by its symbole
    GET_ELEMENT_BY_SYMBOL "$ELEMENT"
  # if it's an element name
  elif [[ $ELEMENT =~ ^[A-Za-z]+$ ]]
  then
    # get the element by its name
    GET_ELEMENT_BY_NAME "$ELEMENT"
  else
    echo -e "Please provide an element as an argument."
  fi
}

TRIM_STR(){
  echo "$(echo $1 | sed -r 's/^ *| *$//g')"
}

SHOW_MESSAGE() {
  ELEMENT_DETAILS=$1
  echo "$ELEMENT_DETAILS" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
  do
    echo "The element with atomic number $(TRIM_STR $ATOMIC_NUMBER) is $(TRIM_STR $NAME) ($(TRIM_STR $SYMBOL)). It's a $(TRIM_STR $TYPE), with a mass of $(TRIM_STR $ATOMIC_MASS) amu. $(TRIM_STR $NAME) has a melting point of $(TRIM_STR $MELTING_POINT_CELSIUS) celsius and a boiling point of $(TRIM_STR $BOILING_POINT_CELSIUS) celsius."
  done
}

MAIN $1