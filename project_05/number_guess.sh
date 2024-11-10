#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {

  # get the username
  echo Enter your username:
  read USERNAME

  # trim the username
  USERNAME="$(echo -n "$USERNAME" | sed -r 's/^ *| *$//g')"

  # if nothing was entered
  if [[ -z $USERNAME ]]
  then
    echo Please put your username.
  # verify that the length is between 1 and 22 chars
  elif [[ $(echo -n "$USERNAME" | wc -m) -gt 22 ]]
  then
    echo "Please put a username between 1 and 22 characters."
  else
    # all is good, get/add the player
    GET_THE_PLAYER "$USERNAME"
  fi

}

GET_THE_PLAYER(){
  USERNAME=$1
  # get the player
  # I'm using the left join here to avoid re-insert a duplicated player (when he has not any game stored in the db)
  PLAYER_INFOS=$($PSQL "SELECT p.player_id, p.username, COUNT(g.game_id) AS games_played, MIN(g.guesses_number) AS best_game FROM players AS p LEFT JOIN games
AS g USING(player_id) WHERE p.username='$USERNAME' GROUP BY player_id;")
  # player not found
  if [[ -z $PLAYER_INFOS ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
    # insert the player into the db
    INSERT_PLAYER=$($PSQL "INSERT INTO players(username) values('$USERNAME')")
    # get the player id
    PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME'")
  else
    # player is already registered
    while IFS="|" read PLAYER__ID USERNAME GAMES_PLAYED BEST_GAME; do
      PLAYER_ID="$PLAYER__ID"
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
    done <<< "$PLAYER_INFOS"
  fi
  # start the game
  START_GAME "$PLAYER_ID"
}

START_GAME(){

  PLAYER_ID=$1
  if [[ -z $PLAYER_ID ]]
  then
    echo Internal error occured!
  else
    # generate the random number
    NUMBER=$(( RANDOM % 1000 + 1 ))
    # create a new game
    INSERT_NEW_GAME=$($PSQL "INSERT iNTO games(number_to_guess, player_id) values($NUMBER, $PLAYER_ID)")
    # get the game id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE number_to_guess=$NUMBER AND player_id=$PLAYER_ID ORDER BY game_id DESC LIMIT 1")

    # start the game
    NUMBER_OF_GUESSES=0
    echo Guess the secret number between 1 and 1000:

    GET_USER_GUESS    
    while [[ $USER_GUESS -ne $NUMBER ]]
    do
      if [[ $USER_GUESS -lt $NUMBER ]]
      then        
        echo "It's higher than that, guess again:"
      elif [[ $USER_GUESS -gt $NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      fi
      GET_USER_GUESS
    done
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!
    # update the game
    UPDATE_GAME=$($PSQL "UPDATE games SET guesses_number=$NUMBER_OF_GUESSES WHERE game_id=$GAME_ID")
  fi
}

GET_USER_GUESS() {
  (( NUMBER_OF_GUESSES++ ))
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    GET_USER_GUESS
  fi
}

MAIN