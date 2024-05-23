#!/bin/bash
 # Check if AUTH-TAG is not empty
 if [ -z "$1" ]
  then
     echo "Error: AUTH-TAG is empty"
     exit 1
 fi

 # Check if DB-TAG is not empty
 if [ -z "$2" ]
  then
     echo "Error: DB-TAG is empty"
     exit 1
 fi


  # Check if REDIS-TAG is not empty
 if [ -z "$3" ]
  then
     echo "Error: REDIS-TAG is empty"
     exit 1
 fi

 # Check if UI-TAG is not empty
 if [ -z "$4" ]
  then
     echo "Error: UI-TAG  is empty"
     exit 1
 fi

 # Check if WEATHER-TAG is not empty
 if [ -z "$4" ]
  then
     echo "Error: WEATHER-TAG  is empty"
     exit 1
 fi


AUTH=`echo $1  | cut -c1`
DB=`echo $2  | cut -c1`
REDIS=`echo $3  | cut -c1`
UI=`echo $4  | cut -c1`
WEATHER=`echo $5  | cut -c1`

# Check if all  TAG  starts with 'v'
if [ $WEATHER == v ] && [ $DB == v ] && [ $REDIS == v ] && [ $UI == v ] && [ $WEATHER == v ]
 then
    echo "all TAG starts with 'v'"
else
    echo "all or some of the TAG  does not start with 'v'"
    exit 1
fi