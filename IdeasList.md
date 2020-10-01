# Ticket to Ride Reinforcement Learning Project

Aspirations/ideas for fun on data from a train-based game

### Data:
* Tables
	* Locations (cities)
	* Routes ( city pairs )
	* sqlite will be adequate for this, develop from csv's
	
### Front End:
	* vizualize plays in _leaflet.js_
	* _d3.js_ for dynamic charts
	* Map needs to look visually appealing without pissing off 
	
### Rules Engine (GamePlay):

### State
	* current hand
	* opponents' selected cards (humans can't into this)
	* board state
		* opponents' routes owned
	* current tickets
	* memories of sequences of opponents moves (results of opponents moves should be evident from board state)

### Algorithms:
	* Deep Reinforcement Learning
	* Could absolutely use monte carlo tree search
	* account for minimum spanning trees in reward shaping?
		* strategies: 
			* minimum spanning tree 
			* weighted minimum spanning tree
			* traveling salesmen (can keep in player state?)
			* slackness variables on optimization for mst?
	* Agent goals
		* WIN
		* WIN + predict opponent's next moves
		* WIN + get as close to optimal as possible (MST)
		* WIN + use as few cards as possible
		* WIN + maximize point difference to next highest player

### Artifacts/Deliverables
	* Written Report
		* LaTeX
			* Literature review
	* Publish? 
	* web application?
		* hosted?
	* deep learning artifacts/pkls?
	* git repo
		* unit & integration test suite
	* youtube video(s)
	* open ai gym simulator
	* everything should run inside a docker container

### Preparation
	* finish learning from data
	* finish Coding the Matrix
	* Grokking Deep Learning
	* Sutton and Barto
	* Deep reinforcement learning



