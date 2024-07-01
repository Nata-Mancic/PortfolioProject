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
Customers who purchase single-ride or full-day passes are referred to as *casual* riders.
Customers who purchase annual memberships are Cyclistic *members*.

Cyclistic’s finance analysts have concluded that annual members are much more profitable
than casual riders. Although the pricing flexibility helps Cyclistic attract more customers,
The director of marketing believes that maximizing the number of annual members will be key to future growth.
Rather than creating a marketing campaign that targets all-new customers, the director of marketing believes
there is a solid opportunity to convert casual riders into members. Casual riders are already aware of the
Cyclistic program and have chosen Cyclistic for their mobility needs.

The director of marketing has set a clear goal: Design marketing strategies aimed at converting casual riders into
annual members. In order to do that, however, the marketing analytics team needs to better understand how
annual members and casual riders differ, why casual riders would buy a membership, and how
digital media could affect their marketing tactics. 

## Dataset

The data for a fictional company Cyclistic are avaliable [here](https://divvy-tripdata.s3.amazonaws.com/index.html).
The dataset used for this project covers the period from **January 2023 to December 2023**. Each file consists of the following columns:

* **ride_id** : unique id of each ride trip
* **rideable_type** : type of bikes ridden (classic, docked or electric)
* **started_at** : date and time of the start of the ride
* **ended_at** : date and time of the end of the ride
* **start_station_name** : start station name
* **start_station_id** : start station id
* **end_station_name** : end station name
* **end_station_id** : end station id
* **start_lat** : latitude of the start location
* **start_lng** : longitude of the start location
* **end_lat** : latitude of the end location
* **end_lng** : longitude of the end location
* **member_casual** : type of membership (casual or member)

## Tools
* Data Cleaning: **Microsoft Excel**
* Data Analysis: **PostgreSQL**
* Visualization: **Tableau Public**

## Data Cleaning
I used Microsoft Excel for cleaning the files. Firstly I checked for duplicates, misspelled and missing values, 
after that I removed columns that are unnecessary for this analysis: start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng.
And I created new column **day_of_week** (from 1 = Monday through 7 = Sunday).

## Data Analysis
I used PostgreSQL to create database for Cyclistic bike-share analysis. I imported .csv files for each month in 2023,
and use **UNION** function to combine tables for each month into one table. 

I added a column **ride_length**, after which I realised that there are 120 rows where ended_at is after the started_at, so these rows were removed from the analysis.
After that total number of rows is **4,232,489**.

Before continuing to the analysis I checked again if there are 3 types of bikes and 2 types of members as it should be.

I performed following analysis in order to find differences between **casual** and **member** customers:
* total number of rides
* percentage of total number of rides

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/d13bec2c-515d-4327-bf4c-a75bd9243c49)

* number of rides per bike type

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/99e523f9-14c2-49df-9c1a-7071bfd4108f)

* average ride lenght

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/b9ab14aa-fefd-4501-8533-3763641006a5)

* number of rides per month and quarter

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/4b49ad70-f3b2-4a37-a474-c20d53d4c573)

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/5096b029-305c-4a99-85dc-6eeb130c2d12)


* number of rides per each day, week (weekday or weekend), and time of the day (morning, afternoon, evening or night)

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/93040d37-cbd7-429a-85b0-618486649b2d)

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/5afc2092-3afe-4a4d-959d-bcbd0352bb05)

  ![image](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/c41ac11a-cd08-4c4b-a974-d041eb7c9423)



## Data Visualization
I created a dashboard using Tableau. The dashboard is shared on [Tableau public](https://public.tableau.com/app/profile/natalija.mancic/viz/Cyclistic_dashboard_17192242813690/membervscasualcustomers).

![member vs casual customers (1)](https://github.com/Nata-Mancic/PortfolioProject/assets/173147286/3aa5d3c9-742b-47a7-b04b-a2a7dbc7bcbe)

## Conclusions

* Annual customers outnumber casual customers.
* Annual members primarily use classic and electric bikes, while casual customers utilize all three types of bikes: classic, electric, and docked.
* Casual customers tend to have longer ride durations.
* The lowest number of rides for casual customers is in the first quarter, while the highest number is in the third quarter, particularly in August.
* Casual customers take more rides during weekends.
* Annual members mostly ride in the mornings and afternoons, and casual customers have the highest number of rides in the afternoons and evenings.

To convert casual customers into annual customers I suggest the following strategies:
* **Weekend Promotions**: Since casual members ride more during weekends, create special promotions, discounts, or events that encourage weekend rides.
* **Seasonal Offers**: Promote bike rentals during the third quarter, especially in August, when it's a peak season for casual customers.
* **Highlight on the docked bikes**: As casual members use all bike types, highlight the availability of docked bikes in marketing materials.
* **Feedback**: Gather feedback from casual users to understand their needs and preferences, and adjust services accordingly.
* **Cost Comparison**: Show the cost savings of an annual membership compared to frequent casual usage. Use data to show how much casual members could save annually.
* **Unlimited Rides**: Highlight the benefit of unlimited or a higher number of rides included in the annual membership compared to the casual ride model.
* **Rewards program**: Implement a rewards program where annual members can earn points or rewards.
* **Trial Memberships**: Offer trial periods for annual memberships at a reduced rate, allowing casual members to experience the benefits before committing.

By implementing these strategies company can adjust its services to meet the needs of casual users, show the value of annual memberships to casual users and encourage them to make the transition.
