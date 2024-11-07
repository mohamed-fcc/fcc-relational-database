#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# truncate any test data already inserted in both tables
echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  # insert teams

  # process only data, not the titles
  # start by the winner team
  if [[ $WINNER != 'winner' ]]
  then
    # get winner id
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    # not found in the db
    if [[ -z $WINNER_ID ]]
    then
      # insert it
      INSERT_WINNER_RESULT=$($PSQL "insert into teams(name) values('$WINNER');")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted team : $WINNER
      fi
      WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    fi
  fi
  # the opponent team
  if [[ $OPPONENT != 'opponent' ]]
  then
    # get opponent id
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    # not found in the db
    if [[ -z $OPPONENT_ID ]]
    then
      # insert it
      INSERT_OPPONENT_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT');")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted team : $OPPONENT
      fi
      OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    fi
  fi  

  # insert games into the db
  INSERT_GAME_RESULT=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS);")
  if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted game : world cup $YEAR : $WINNER $WINNER_GOALS : $OPPONENT_GOALS $OPPONENT
  fi

done
