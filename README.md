# Airline Database

## Overview
This project involves creating and population an airline database using SQL. The database consists of serveral tables that store information about flights, passengers, tickets, and credit card details.

## Database Structure
The database is named 'flight' and contains the following tables:
- 'air_credit_card_details'
- 'air_passenger_profile'
- 'air_ticket_info'
- 'air_flight_details'
- "air_flight'

### Table Descriptions
1. **air_credit_card_details**
  - Stores details about the passenger's credit cards.
  - Columns: 'profile_id', 'card_number', 'card_type', 'expiration_month', 'expiration_year'.

2. **air_passenger_profile**
  - Stores profile information of passengers.
  - Columns: 'profile_id', 'password', 'first_name', last_name', 'address', 'mobile_number', 'emdil_id'.

3. **air_ticket_info**
  - Stores information about ticket bookings.
  - Columns: 'ticket_id', 'profile_id', 'flight_id', 'flight_departure_date', 'status'.

4. **air_flight_details**
  - Stores detailed information about flights, including prices and seat availability.
  - Columns: 'flight_id', 'flight_departure_date', 'price', 'available_seats'.

5. **air_flight**
  - Stores information about flights including departure and arrival details.
  - Columns: 'flight_id', 'airline_id', 'airline_name', 'from_location', 'to_location', 'departure_time', 'arrival_time, 'duration', 'total_seats'.
## Business Problem and Solutions
#### 1. Develop a SQL query to analyze the flight booking data for our airline. The goal is to understand the booking patterns of passengers traveling from Chennai to Hyderabad. The query should return details about the passenger, the flight, and the number of tickets booked. This information will help us to better understand our customers and improve our services.

**SQL Query:**
```sql
select
  t.profile_id,
  p.first_name,
  p.last_name,
  t.flight_id,
  t.flight_departure_date,
  count(t.profile_id)
from
  air_passenger_profile p
join
  air_ticket_info t on p.profile_id = t.profile_id
join
  air_flight f on f.flight_id = t.flight_id
where
  from_location = 'chennai' and to_location = 'hyderabad'
group by
  t.ticket_id, t.profile_id, t.flight_id
order by
  p.profile_id,f.flight_id,t.flight_departure_date;
```
#### 2. Develop a SQL query to identify the passenger(s) who have booked the maximum number of tickets. This will help us identify our most frequent flyers and potentially offer them special deals or rewards. The query should return the profile_id of the passenger(s) and handle the case where multiple passengers have booked the same maximum number of tickets.

**SQL Query:**
```sql
select
  profile_id
from
  air_ticket_info
group by
  profile_id
having
  count(profile_id)>= all(select count(profile_id) from air_ticket_info group by profile_id)
order by
  profile_id;
```

#### 3. Develop a SQL query to inform passengers about a one-hour delay in the departure time of the Chennai to Hyderabad flight on 6th May 2013. This query will help us communicate effectively with our passengers and manage their expectations. The query should return details about the passenger, the flight, the actual and delayed departure and arrival times.

**SQL Query:**
```sql
select
  t.profile_id,
  p.first_name,
  p.last_name,
  t.flight_id,
  t.flight_departure_date,
  f.departure_time,
  f.arrival_time,
  addtime(f.departure_time,"1:0:0:0"),
  addtime(f.arrival_time,"1:0:0:0") 
from
  air_ticket_info t
join
  air_passenger_profile p on t.profile_id=p.profile_id
join
  air_flight f on f.flight_id = t.flight_id
where
  f.from_location = "chennai" and f.to_location="hyderabad" and t.flight_departure_date='2013-05-06';
```

#### 4. Develop a SQL query to analyze the booking data of customers based in Kochi. The goal is to understand the booking patterns of these customers by counting the number of tickets they have booked. The query should return details about the customer and the number of tickets booked. This information will help us to better understand our customers in Kochi and improve our services.

**SQL Query:**
```sql
select
  t.profile_id,
  p.first_name,
  substring_index(substring_index(p.address,'-',-2),"-",1) Base,
  count(t.profile_id)
from
  air_ticket_info t
join
  air_passenger_profile p on p.profile_id = t.profile_id
where
  p.address LIKE '%Kochi%'
order by
  p.first_name;
```

#### 5. Develop a SQL query to identify the flight(s) with the least number of services in the month of May. This will help us understand our flight schedule and potentially optimize our operations. The query should return details about the flight and the number of services offered.

**SQL Query:**
```sql
select
  afd.flight_id,
  af.from_location,
  af.to_location,
  count(afd.flight_id) No_of_Services
from
  air_flight_details afd
join
  air_flight af on af.flight_id=afd.flight_id
where
  monthname(afd.flight_departure_date)='May'
group by
  afd.flight_departure_date
having
  count(afd.flight_id) <=all(
    select
      count(flight_id)
    from
      air_flight_details
    where
      monthname(flight_departure_date)='May'
    group by
      flight_departure_date)
order by flight_id;
```
#### 6. Develop a SQL query to categorize and display the flights available at different times of the day: Morning, Afternoon, Evening, and Night. This will help us understand our flight schedule and potentially optimize our operations. The query should return details about the flight, the departure time, and the time of service.

**SQL Query:**
```sql
select
  flight_id,
  from_location,
  to_location, departure_time,
case
	when departure_time between "5:00:01" and "12:00:00" then "Morning"
  when departure_time between "12:00:01" and "18:00:00" then "Afternoon"
  when departure_time between "18:00:01" and "24:00:00" then "Evening"
  else "Night"
end
  Time_of_Service
from
  air_flight
order by
  flight_id;
```
