# Diary

This document will be a place I track my progress and record ideas (denoted by IDEA: in all caps), and things to do next (denoted by TODO: in all caps).  Implemented TODOs and IDEAs will be ~~stricken through~~ and result written after them in italics (_implemented_, _not implemented_)

Refer to IdeasList.md as a pseudo backlog for things to do next in this project.

# 2020-09-28
- Finished Data entry of
	- legs (leg\_master.csv): connections between cities, their colors, and lengths (number of cars to connect)
	- scores (score\_master.csv): point values associated with numbers of cars on a leg (the score for completing a leg increases non-lineary with the length of that leg)
	- tickets (tickets\_master.csv): the origin, destination, and point values of a ticket (note that these are bi-directional--it dosn't matter if you complete a leg from LA->NY or NY->LA)
	- cities (city\_state\_master.csv): this is not finished as yet.  We have all cities entered, 
		- cities table also includes the degree of each city (number of connections to other cities)	
	- TODO: we also want to get cities' latitudes and longitudes so that we can plot them in leaflet.js or some other visualization.
	- TODO: create table with number of cards of each color (include engines!) in the deck
	- TODO: create a table with the player colors (colors for car tokens)
	- IDEA: create a style guide with a proper name and a picture for each item in the game (car cards, tickets (route cards), car tokens, etc.)
- Next steps are mostly around validation of these datasets.  I will describe some tests to ensure that we have accurately represented the game board.
	- In general, the way we will perform these data validation tests is to 
		1. load the data from the CSV's into a sqlite database (using python)
		1. code up several assert statements that test for properties of the maps
		1. perform all of these validation steps against data read from csv's into a sqlite database
		1. set up everything to run in a docker container so that this stays as platform independent as possible
		1. write a bash script
			a. IDEA: write a powershell script to build and run the container on windows.
	- IDEA: we will need to compile several validation tables to perform these tests
		- counts of the number of tiles of each color on the game board
		- out degree of each city (already recorded in city_state_master.csv)
	- Validation tests:
		- TODO: count number of cities on the map, ensure that count-distinct of cities in city_state_master matches
		- TODO: ensure that the number of distinct cities in leg_master.csv matches the counted number of cities
		- TODO: count the number of tiles of each color on the map (total), ensure that it matches the sum of the NUM_CARS field in leg_master.csv by route color
		- TODO: count the number of tickets, ensure that the count matches the number (total) in the tickets_master.csv file
		- TODO: manually review socre_master.csv and tickets_master.csv to ensure they accurately represent the data available
		- TODO: ensure that all lats and lons occur in the continental united states (generalize to bounding box)
	- If a validation test fails, a failure message should be written out to a file with enough information to diagnose and correct the mistake.  
	- If all data validation tests pass, a file with the phrase "SUCCESS: All tests passed!" should be written out
	- TODO: write a description of how the data was collected and checked (especially the leg_master.csv table) and include images (take some pictures!)

- After the validation scripts are written and we're fairly satisfied with the accuracy of the data, begin work on some javascript classes to take the data and draw a map!
	- start with straight lines between cities with the ROUTE\_COLOR and NUM\_CARS as tags on the straight lines
	- later we can devise an algorithm to draw the lines with a number of segments representative of the NUM\_CARS and curvature to allow for the placement of the number of cars
		- we can use a different style of line to show that the leg has been taken (captured?) by a player of a certain color.

- TODO: figure out how to save this in git so you can track your progress.  Consider using feature branches.

# 2020-09-29
	LOL.  Met with class group.  No work on this was done.
# 2020-09-30
- Finished bash script that creates a sqlite3 database
	- because we needed to run multiple commands in the sqlite3 shell from the bash shell sqlite3 command, had to echo and pipe them into stdin of the sqlite3 command.
	- kinda tricky to figure this out
	- unfortunately, bash on my mac doesn't support declaration of associative array datatypes (declare -A)
	- Databases now exist!
- Working through list of todo's from 9/28.  
	- adding lats and lons to cities table

