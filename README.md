# HighCheck
Little CheckList app I am making for myself
The main goal of this project is to familiarize myself with storing json locally on a machine and a calendar package called Calendar_table. 
The project is made using Flutter / Dart and is compatatble with both Android and iOS. 

# How to run the application
Have Flutter requirements installed: 
https://docs.flutter.dev/get-started/install

Open the project in VSCode. 
``` cd .\highcheck\ ```
Launch your emulator
``` flutter run ```

# Feature list

## General 

* Add an event to the list
    * Popup to add this event
* Repeated event(s)
    * Daily
    * Weekly ( on the day, i.e. every Sunday )
    * Bimonthly ( on the same day )
    * Monthly ( on the same number day, ie every fourth )
    * Monthly ( on same day, ie every 3rd Sunday )
    * Bi Yearly ( add 6 months roughly to original day )
    * Yearly ( add 365 roughly to original day )

## Home page

* List of Late tasks
* List of tasks for the day
* List of tasks for the week
    * How many days until that task completion day
* List of tasks for the month
    * How many days until that tasks completion day
* This page allows the user to check off the tasks as either completed or "ignore"

## Calendar page

* Use the calendar table package to display a calendar - **DONE**
    * Display if there are events on that day **DONE**
* Zoom in to see the day 
* Add event on a day ( could be the popup mentioned in general )

## Settings page

* Let the user choose their prefferred palette
* A page that shows the user's accomplishments for the day, week, month, year  
    * This would be a bar chart that would show the amount of accomplished, late, "uncompleted" tasks for each category

# Rough Designs

https://whimsical.com/WWpCYLiGJPii4Q6JeHJkQS