--question 3

--up to 1 mile
Select COUNT(1) from green_taxi_data
where date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_dropoff_datetime) < '2019-11-01'
and trip_distance <= 1

--over 10
Select COUNT(1) from green_taxi_data
where date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_dropoff_datetime) < '2019-11-01'
and trip_distance > 10


--7 and 10
Select COUNT(1) from green_taxi_data
where date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_dropoff_datetime) < '2019-11-01'
and trip_distance > 7 and trip_distance <= 10

--3 and 7
Select COUNT(1) from green_taxi_data
where date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_dropoff_datetime) < '2019-11-01'
and trip_distance > 3 and trip_distance <= 7

--1 and 3
Select COUNT(1) from green_taxi_data
where date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_dropoff_datetime) < '2019-11-01'
and trip_distance > 1 and trip_distance <= 3

--question 4

select lpep_pickup_datetime, MAX(trip_distance) from green_taxi_data group by lpep_pickup_datetime order by 2 desc

--question 5

select tz."Zone" , SUM(total_amount), count(1) from green_taxi_data gtd 
left join taxi_zones tz on gtd."PULocationID" =tz."LocationID" 
where date(lpep_pickup_datetime) = '2019-10-18'
group by tz."Zone"
HAVING SUM(total_amount) > 13000
order by 3 desc 

--question 6

SELECT 
drop."Zone",
gtd.tip_amount
FROM 
    green_taxi_data gtd
LEFT JOIN 
    taxi_zones pu ON gtd."PULocationID" = pu."LocationID"
LEFT JOIN 
    taxi_zones drop ON gtd."DOLocationID" = drop."LocationID"
where pu."Zone" = 'East Harlem North' and 
	EXTRACT(month from gtd."lpep_pickup_datetime") = 10
order by 2 DESC

