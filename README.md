# AM10_Group8

## Topic
* For our project, we decided to analyze road accidents in France from the years 2005 to 2016. 
  * The accidents in this data set include details for all parties involved in each accident
  * The vehicle and pedestrian details are also documented
  * Geographical coordinates and postal addresses of the accidents are also provided
  * The data is spread out between 5 different data sets, which will have to be annexed and cleaned prior to analysis

## Issues or questions we are addressing
* We are interested in discovering:
  * Whether certain regions of France have more accidents than others 
  * Whether more accidents occur during certain times of day
  * If certain weather leads to significantly more crashes than others
  * How the number of accidents per year changes over time
  * If more accidents happen on certain days of the week than others
  * What type of roads experience the most amount of accidents
  * What proportion of accidents are actually fatal
  * If certain speeds account for more accidents than others
  
* Additionally, we will investigate how road conditions, weather, vehicle type, age range, and other relevant variables affect the lethality of these crashes.


## Source of data
* We obtained our data from Kaggle, which is a virtual repository with thousands of real-world data sets available for free. 
  * The exact url address is: *https://www.kaggle.com/ahmedlahlou/accidents-in-france-from-2005-to-2016*

## Statistical techniques we will be using
* Visualization techniques:
  * We will create heatmaps to illustrate certain relationships
  * We will use an array of bar and line graphs to illustrate our findings
  * We will also create a geographical map to illustrate regional differences

* Modelling techniques: 
  * We will utilize a logistic ridge regression to create a classification model
    * We aim to predict whether or not any given crash will be lethal given certain environmental and situational factors
    * We will train the model on half of the data set and test it on the other half
    * Goal: achieve classification accuracy in excess of 75%

