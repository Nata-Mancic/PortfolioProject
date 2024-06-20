-- creating a table for january
CREATE TABLE january (
	ride_id VARCHAR(16) NOT NULL PRIMARY KEY, 
	rideable_type VARCHAR(25) NOT NULL,
	started_at TIMESTAMP NOT NULL,
	ended_at TIMESTAMP NOT NULL,
	start_station_name VARCHAR(100),
	end_station_name VARCHAR(100),
	member_casual VARCHAR(50) NOT NULL,
	day_of_week SMALLINT NOT NULL)
	
--after importing the table, checking the table

SELECT * 
FROM 
	january

--importing files for the rest of the year and merging tables

SELECT * INTO annual_data
FROM 
	january
UNION ALL 
	SELECT * FROM february
UNION ALL 
	SELECT * FROM march
UNION ALL 
	SELECT * FROM april
UNION ALL 
	SELECT * FROM may
UNION ALL 
	SELECT * FROM august
UNION ALL 
	SELECT * FROM september
UNION ALL 
	SELECT * FROM october
UNION ALL 
	SELECT * FROM november
UNION ALL 
	SELECT * FROM december

--checking the new table

SELECT * 
FROM 
	annual_data
LIMIT 1000

--adding a new column for ride lenght
ALTER TABLE 
	annual_data
ADD COLUMN 
	ride_length TIME

UPDATE 
	annual_data
SET
	ride_length = age(ended_at, started_at)
WHERE 
	ended_at > started_at

--removing the rows where ended_at is before started_at (120 rows)

DELETE FROM 
	annual_data
WHERE 
	ended_at < started_at

--adding a column for ride minutes
ALTER TABLE
	annual_data
ADD COLUMN 
	ride_minutes INT

UPDATE 
	annual_data
SET
	ride_minutes = EXTRACT(epoch FROM (ended_at - started_at)) / 60

--checking types of bikes (docked,classic, and electric)

SELECT 
	DISTINCT(rideable_type) 
FROM 
	annual_data

--checking types of membership (member, causal)
SELECT
	DISTINCT(member_casual) 
FROM
	annual_data


--difference between member type = total number of rides
SELECT 
	member_casual AS member_type,
	COUNT(member_casual) AS ride_count,
	ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percent_member
FROM 
	annual_data
GROUP BY
	member_casual

--difference between member type = bike type
SELECT
	rideable_type,
	member_casual AS member_type,
	COUNT(member_casual) AS total_rides
FROM
	annual_data
GROUP BY
	rideable_type,
	member_casual
	
--difference between ride length
SELECT
	member_casual AS member_type,
	ROUND(AVG(ride_minutes),0) AS average_ride_minutes
FROM
	annual_data
GROUP BY
	member_casual
	
--difference between months
SELECT
	EXTRACT (MONTH from started_at) AS month,
	member_casual AS member_type,
	COUNT(member_casual) AS ride_per_month
FROM
	annual_data
GROUP BY
	month,
	member_casual

--difference between quarters
SELECT
	CASE
		WHEN EXTRACT (MONTH from started_at) IN(1,2,3) THEN 'Q1'
		WHEN EXTRACT (MONTH from started_at) IN(4,5,6) THEN 'Q2' 
		WHEN EXTRACT (MONTH from started_at) IN(7,8,9) THEN 'Q3'
		ELSE 'Q4'
	END AS quarter,
	member_casual AS member_type,
	COUNT(member_casual) AS ride_count
FROM
	annual_data
GROUP BY
	quarter,
	member_casual
	
--difference between days
SELECT
	day_of_week,
	member_casual AS member_type,
	COUNT(member_casual) AS ride_per_day
FROM
	annual_data
GROUP BY
	day_of_week,
	member_casual

--difference between weekday and weekends
SELECT
	CASE
		WHEN day_of_week BETWEEN 1 AND 5 THEN 'weekday'
		ELSE 'weekend'
	END AS workday_weekend,
	member_casual AS member_type,
	COUNT(member_casual) AS ride_count
FROM
	annual_data
GROUP BY
	workday_weekend,
	member_casual

--difference between time of the day
SELECT
	CASE
		WHEN to_char(started_at, 'HH24:MI:SS') 
			BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
		WHEN to_char(started_at, 'HH24:MI:SS') 
			BETWEEN '12:00:01' AND '17:00:00' THEN 'afternoon' 
		WHEN to_char(started_at, 'HH24:MI:SS') 
			BETWEEN '17:00:01' AND '21:00:00' THEN 'evening'
		ELSE 'night'
	END AS time_of_day,
	member_casual AS member_type,
	COUNT(member_casual) AS ride_count
FROM
	annual_data
GROUP BY
	time_of_day,
	member_casual
