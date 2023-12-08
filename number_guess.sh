#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME_INPUT

USERNAME=$($PSQL "select username from players where username='$USERNAME_INPUT'")

if [[ -z $USERNAME ]]; then

  echo -e "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
  #Add player to database
  INSERT_PLAYER=$($PSQL "insert into players(username) values('$USERNAME_INPUT')")
  UPDATE_GAMES_PLAYED=$($PSQL "update players set games_played=1 where username='$USERNAME_INPUT'")
else
  #Get games_played
  GAMES_PLAYED=$($PSQL "select games_played from players where username='$USERNAME'")
 
  #Get best_game
  BEST_GAME=$($PSQL "select best_game from players where username='$USERNAME'")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  
  #Increment games_played
  ((GAMES_PLAYED++))
  
  #Update games_played
  UPDATE_GAMES_PLAYED=$($PSQL "update players set games_played=$GAMES_PLAYED where username='$USERNAME'")

fi

RANDOM_NUMBER=$((1 + RANDOM % 1000))

UPDATE_GAMES(){
#Get player_id
PLAYER_ID=$($PSQL "select player_id from players where username='$USERNAME_INPUT'")

#Update games
INSERT_PLAYER_GAMES=$($PSQL "insert into games(player_id,guesses) values($PLAYER_ID,$guess_counter)")

#Filter best_game with lowest number of guesses by player_id
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games where player_id=$PLAYER_ID")


UPDATE_BEST_GAME=$($PSQL "update players set best_game=$BEST_GAME where player_id=$PLAYER_ID")
}

EVALUATE_GUESS(){
  read GUESS_NUMBER
   if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
      # send to main menu
      echo "That is not an integer, guess again:"

  else
      if [[ $GUESS_NUMBER > $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $GUESS_NUMBER < $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      elif [[ $GUESS_NUMBER = $RANDOM_NUMBER ]]
      then
        UPDATE_GAMES
        echo "You guessed it in $1 tries. The secret number was $RANDOM_NUMBER. Nice job!"
      fi
  fi
}



echo -e "Guess the secret number between 1 and 1000:"

guess_counter=1

EVALUATE_GUESS $guess_counter

until [[ $GUESS_NUMBER == $RANDOM_NUMBER ]]
do
  ((guess_counter++))
  EVALUATE_GUESS $guess_counter
done

