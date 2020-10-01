#!/bin/bash

# delete old database if it exists
TTRM="TTRM"
if test -f $TTRM; then
	rm -f $TTRM
fi

# create database
sqlite3 TTRM ''


# create tables and load csv's to tables
## directories
crtStDir=./createStatements/
gDCDir=./GameDataCSVs/

## city table
cat "${crtStDir}createCityTable.sql" | sqlite3 TTRM
tail -n +2 ${gDCDir}city_state_master.csv > temp.csv
echo -e ".mode csv \n.header on\n.import temp.csv CITY" | sqlite3 TTRM
rm -f temp.csv

## legs table
tail -n +2 ${gDCDir}leg_master.csv > temp.csv
cat "${crtStDir}createLegsTable.sql" | sqlite3 TTRM
echo -e ".mode csv \n.import temp.csv LEGS" | sqlite3 TTRM
rm -f temp.csv

## scores
tail -n +2 ${gDCDir}score_master.csv > temp.csv
cat "${crtStDir}createScoreTable.sql" | sqlite3 TTRM
echo -e ".mode csv \n.import temp.csv SCORE" | sqlite3 TTRM
rm -f temp.csv

## Tickets
tail -n +2 ${gDCDir}tickets_master.csv > temp.csv
cat "${crtStDir}createTicketsTable.sql" | sqlite3 TTRM
echo -e ".mode csv \n.import temp.csv TICKETS" | sqlite3 TTRM
rm -f temp.csv


