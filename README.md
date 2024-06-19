# Portfolio Project

Welcome to the Cyclistic bike-share analysis case study!

## Scenario

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations
across Chicago. The bikes can be unlocked from one station and returned to any other station
in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable
than casual riders. Although the pricing flexibility helps Cyclistic attract more customers,
The director of marketing believes that maximizing the number of annual members will be key to future growth.
Rather than creating a marketing campaign that targets all-new customers, the director of marketing believes
there is a solid opportunity to convert casual riders into members. Casual riders are already aware of the
Cyclistic program and have chosen Cyclistic for their mobility needs.

The director of marketing has set a clear goal: Design marketing strategies aimed at converting casual riders into
annual members. In order to do that, however, the team needs to better understand how
annual members and casual riders differ, why casual riders would buy a membership, and how
digital media could affect their marketing tactics. Cyclistic marketing analytics team is interested in
analyzing the Cyclistic historical bike trip data to identify trends.

## Dataset

The data for a fictional company Cyclistic are avaliable [here](https://divvy-tripdata.s3.amazonaws.com/index.html).
The dataset used for this project covers the period from January 2023 to December 2023. Each file consists of the following columns:

* ride_id : unique id of each ride trip
* rideable_type : type of bicycle ridden (classic, docked or electric)
* started_at : date and time of the start of the ride
* ended_at : date and time of the end of the ride
* start_station_name : start station name
* start_station_id : start station id
* end_station_name : end station name
* end_station_id : end station id
* start_lat : latitude of the start location
* start_lng : longitude of the start location
* end_lat : latitude of the end location
* end_lng : longitude of the end location
* member_casual : type of membership (casual or member)

## Tools
* Data Cleaning: Microsoft Excel
* Data Analysis: PostgreSQL
* Visualization: Tableau Public

## Data Cleaning
I used Microsoft Excel for cleaning the files. Firstly I checked for duplicates, misspelled and missing values, 
after that I removed columns that are unnecessary for this analysis: start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng.

I created new columns: ride_length (ended_at - started_at) and day_of_week (from 1 = Monday through 7 = Sunday).

## Data Analysis
I used PostgreSQL to create database for Cyclistic bike-share analysis. I imported .csv files for each month in 2023,
and use UNION function to combine tables for each month into one table.

