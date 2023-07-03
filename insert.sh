#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear data from the games then teams table before copy
echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;")

# Read games.csv data to populate the teams table, avoiding duplicates
# This data will also be used for populating the games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Ignore the header data at begining of the file
  if [[ $YEAR != "year" ]]
  then
    # Get winners name and check if its already in the teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # If there was no value returned, z value, -z no value
    if [[ -z $WINNER_ID ]]
    then
      # Insert the value into the table
      RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
      # # Print successful insert to terminal
      # if [[ $RESULT == "INSERT 0 1" ]]
      # then
      #   echo Inserted into teams, $WINNER
      # fi
    fi

    # Get opponents name and check if its already in the teams table
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # If there was no value returned, z value, -z no value
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert the value into the table
      RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
      # # Print successful insert to terminal
      # if [[ $RESULT == "INSERT 0 1" ]]
      # then
      #   echo Inserted into teams, $OPPONENT
      #fi
    fi
    
    # Insert all fields into Game table
    # Get the Opponent ID from the teams table
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # Get the Winner ID from the teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # Read variables YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
    RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  fi
done  