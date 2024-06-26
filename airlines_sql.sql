create database flight;

use flight;

CREATE TABLE air_credit_card_details
(
profile_id VARCHAR(10) NOT NULL,
card_number BIGINT,
card_type VARCHAR(45),
expiration_month INT,
expiration_year INT
);

CREATE TABLE air_passenger_profile
(
profile_id VARCHAR(10) NOT NULL ,
password VARCHAR(45) NULL ,
first_name VARCHAR(45) NULL ,
last_name VARCHAR(45) NULL ,
address VARCHAR(45) NULL ,
mobile_number BIGINT NULL ,
email_id VARCHAR(45) NULL 
);

CREATE TABLE air_ticket_info
(
ticket_id VARCHAR(45) NOT NULL ,
profile_id VARCHAR(10) NULL ,
flight_id VARCHAR(45) NULL ,
flight_departure_date DATE NULL ,
status VARCHAR(45) NULL 
);

CREATE TABLE air_flight_details
(
flight_id VARCHAR(45) NOT NULL ,
flight_departure_date DATE NULL ,
price DECIMAL(10,2) NULL ,
available_seats INT NULL 
);

CREATE TABLE air_flight 
(
flight_id VARCHAR(45) NOT NULL ,
airline_id VARCHAR(45) NULL ,
airline_name VARCHAR(45) NULL ,
from_location VARCHAR(45) NULL ,
to_location VARCHAR(45) NULL ,
departure_time TIME NULL ,
arrival_time TIME NULL ,
duration TIME NULL ,
total_seats INT NULL 
);

INSERT INTO air_credit_card_details VALUES
(1, 622098761234, 'debit', 5, 2013),
(2, 652362563625, 'credit', 1, 2013),
(1, 765432345678, 'credit', 2, 2013),
(3, 654378561234, 'debit', 6, 2013),
(4, 625417895623, 'debit', 2, 2013),
(5, 865478956325, 'debit', 3, 2013),
(6, 789563521457, 'credit', 4, 2013),
(2, 543267895432, 'credit', 8, 2013),
(1, 256369856321, 'debit', 1, 2013);

INSERT INTO air_flight VALUES
(3173, 'MH370', 'abc', 'hyderabad', 'chennai', '06:30:00', '07:15:00',
'0:45:00', 100),
(3178, 'MH17', 'def', 'chennai', 'hyderabad', '08:00:00', '09:00:00',
'1:00:00', 200),
(3172, 'AR342', 'fgh', 'kolkata', 'chennai', '11:30:00', '13:00:00',
'1:30:00', 100),
(3071, 'JT564', 'jkl', 'chennai', 'delhi', '08:00:00', '10:00:00', '2:00:00', 100),
(3170, 'DT345', 'xyz', 'delhi', 'kolkata', '21:00:00', '22:30:00', '1:30:00',
100),
(3175, 'MJ654', 'abc', 'chennai', 'hyderabad', '15:00:00', '16:00:00',
'1:00:00', 200),
(3176, 'MH370', 'def', 'kochi', 'chennai', '18:00:00', '19:05:00', '1:05:00',
100),
(3177, 'MH45', 'fgh', 'delhi', 'kochi', '19:00:00', '21:00:00', '2:00:00', 200),
(3174, 'MH321', 'xyz', 'kolkata', 'delhi', '0:00:00', '2:00:00', '2:00:00',
100),
(3179, 'JT435', 'abc', 'chennai', 'kolkata', '14:00:00', '15:00:00', '1:00:00',
100),
(3180, 'JT456', 'ijk', 'kolkata', 'kochi', '5:00:00', '5:45:00', '0:45:00', 200);

INSERT INTO air_flight_details VALUES
(3170, '2013-02-14', 1000, 10),
(3171, '2013-03-15', 5000, 0),
(3172, '2013-02-05', 3000, 32),
(3173, '2013-04-07', 2000, 12),
(3174, '2013-04-05', 3800, 3),
(3175, '2013-05-25', 3500, 10),
(3176, '2013-03-14', 8000, 2),
(3177, '2013-06-15', 1500, 0),
(3178, '2013-05-06', 3000, 5),
(3179, '2013-04-03', 4000, 15),
(3180, '2013-04-02', 3000, 14);

INSERT INTO air_ticket_info VALUES
(1, 1, 3178, '2013-05-06', 'delayed'),
(2, 5, 3179, '2013-04-03', 'on time'),
(2, 4, 3180, '2013-04-02', 'on time'),
(1, 2, 3177, '2013-06-15', 'on time'),
(1, 3, 3176, '2013-03-14', 'on time'),
(3, 1, 3171, '2013-03-15', 'on time'),
(4, 4, 3172, '2013-02-06', 'delayed'),
(5, 2, 3178, '2013-06-05', 'on time'),
(4, 3, 3171, '2013-03-15', 'on time'),
(5, 1, 3175, '2013-05-25', 'on time'),
(6, 3, 3177, '2013-06-15', 'on time');

INSERT INTO air_passenger_profile VALUES
(1, 'godbless', 'John', 'Stuart','Street 21, Near Bus Stop-Hyderabad-432126',
9865263251, 'john@gmail.com'),
(2, 'heyyaa', 'Robert', 'Clive', 'Sector 3, Technopolis-Kolkata-700102',
9733015875, 'robert@yahoo.com'),
(3, 'hello123', 'Raj', 'Sharma', 'House No. 3, Anna Nagar-Kochi-452314',
9775470232, 'raj3452@hotmail.com'),
(4, 'yesboss', 'Sanjay', 'Mittal','21 Cauunaught Place-Delhi-144985',
9856856321, 'sanjay@yahoo.com'),
(5, 'imhere', 'Tony', 'Stark', '51A, Greams Lane-Chennai-144587',
9832015785, 'tony@gmail.com');

select f.flight_id, f.from_location, f.to_location, avg(d.price) from air_flight_details d
join air_flight f on f.flight_id = d.flight_id
where f.airline_name = "abc"
group by d.flight_id;

SELECT f.from_location,f.to_location,
monthname(af.flight_departure_date) Month_Name,
count(af.flight_departure_date) No_of_Services 
FROM air_flight f LEFT JOIN air_flight_details af
ON f.flight_id = af.flight_id
GROUP BY f.from_location,f.to_location,Month_Name
ORDER BY f.from_location,f.to_Location,Month_Name;

select * from air_flight_details;

select t.profile_id, p.first_name, p.address, count(t.profile_id) from air_passenger_profile p
join air_ticket_info t on p.profile_id = t.profile_id
join air_flight f on f.flight_id = t.flight_id
where f.airline_name = 'abc'
group by t.profile_id;

select t.profile_id, p.first_name, p.last_name, t.flight_id, t.flight_departure_date, count(t.profile_id) from air_passenger_profile p
join air_ticket_info t on p.profile_id = t.profile_id
join air_flight f on f.flight_id = t.flight_id
where from_location = 'chennai' and to_location = 'hyderabad'
group by t.ticket_id, t.profile_id, t.flight_id;

select d.flight_id, f.from_location, f.to_location, d.price from air_flight_details d
join air_flight f on f.flight_id = d.flight_id
where monthname(d.flight_departure_date) = 'April';

select d.flight_id, f.from_location, f.to_location, avg(d.price) from air_flight_details d
join air_flight f on f.flight_id = d.flight_id
group by d.flight_id
ORDER BY f.flight_id,f.from_location,f.to_location;

select t.profile_id, concat(p.first_name, ",", p.last_name), p.address from air_passenger_profile p
join air_ticket_info t on p.profile_id = t.profile_id
join air_flight f on f.flight_id = t.flight_id
where f.from_location='chennai' and f.to_location='hyderabad'
group by t.profile_id;

select profile_id from air_ticket_info
group by profile_id
having count(profile_id)>= all(select count(profile_id) from air_ticket_info group by profile_id);

select t.flight_id, f.from_location, f.to_location, count(t.flight_id) from air_ticket_info t
join air_flight f on f.flight_id = t.flight_id
where f.airline_name = "abc"
group by t.flight_id;

select flight_id, count(flight_departure_date), price from air_flight_details
group by flight_id
order by price desc;

select flight_id, flight_departure_date, count(flight_id) from air_ticket_info
group by flight_id,flight_departure_date
order by flight_id asc, flight_departure_date asc;

select profile_id from air_ticket_info
group by profile_id
having count(profile_id)<= all (select count(profile_id) from air_ticket_info
group by profile_id);

select t.profile_id, p.first_name, p.mobile_number, p.email_id from air_ticket_info t
join air_passenger_profile p on t.profile_id=p.profile_id
join air_flight f on f.flight_id = t.flight_id
where f.from_location = "hyderabad" and f.to_location="chennai"
order by p.profile_id;

select t.profile_id, p.first_name, p.last_name, t.flight_id, t.flight_departure_date,
f.departure_time, f.arrival_time, addtime(f.departure_time,"1:0:0:0"), addtime(f.arrival_time,"1:0:0:0") 
from air_ticket_info t
join air_passenger_profile p on t.profile_id=p.profile_id
join air_flight f on f.flight_id = t.flight_id
where f.from_location = "chennai" and f.to_location="hyderabad" and t.flight_departure_date='2013-05-06';

select t.profile_id, p.first_name, substring_index(substring_index(p.address,'-',-2),"-",1) Base,
count(t.profile_id) from air_ticket_info t
join air_passenger_profile p on p.profile_id = t.profile_id
group by t.profile_id
having Base = "Kochi";

select f.flight_id, f.from_location, f.to_location, count(d.flight_id) from air_flight_details d
join air_flight f on f.flight_id = d.flight_id
where monthname(d.flight_departure_date)="May"
group by d.flight_id;

select profile_id, last_name, mobile_number, email_id from air_passenger_profile
where substring_index(substring_index(address,'-',2),'-',-1) = 'chennai'
order by profile_id;

select count(flight_id) from air_flight
where from_location='chennai' and departure_time between '06:00:00' and '18:00:00';

select t.profile_id, p.first_name, p.email_id, p.mobile_number from air_ticket_info t
join air_passenger_profile p on p.profile_id = t.profile_id
where t.flight_id = 3178
group by t.profile_id, t.flight_id;

select d.flight_id, d.flight_departure_date,
case 
	when d.price<3000 then "AIR PASSENGER"
    when d.price between 3000 and 4000 then "AIR BUS"
    when d.price >4000 then "EXECUTIVE PASSENGER"
end Flight_Type
from air_flight_details d
join air_flight f on f.flight_id = d.flight_id
order by d.flight_id asc, d.flight_departure_date asc;

select card_type, count(card_type) as Card_Count from air_credit_card_details
group by card_type;

select d.flight_id, f.from_location, f.to_location, count(d.flight_id) from air_flight_details d
join air_flight f on f.flight_id = d.flight_id
where monthname(d.flight_departure_date) = "May"
group by d.flight_id,f.from_location;

select flight_id, from_location, to_location, departure_time,
case
	when departure_time between "5:00:01" and "12:00:00" then "Morning"
    when departure_time between "12:00:01" and "18:00:00" then "Afternoon"
    when departure_time between "18:00:01" and "24:00:00" then "Evening"
    else "Night"
end Time_of_Service
from air_flight;

select from_location, count(from_location) from air_flight
group by from_location;

select f.flight_id, f.from_location, f.to_location, t.flight_departure_date, count(t.ticket_id) Number_of_Passengers
from air_ticket_info t join air_flight f on f.flight_id = t.flight_id
group by t.flight_id, f.from_location, f.to_location, t.flight_departure_date
ORDER BY f.flight_id,t.flight_departure_date;

SELECT af.flight_id,af.from_location,af.to_location,ati.flight_departure_date,
count(ati.ticket_id) No_of_Passengers FROM
air_flight af JOIN air_ticket_info ati ON af.flight_id=ati.flight_id
GROUP BY af.flight_id,af.from_location,af.to_location,ati.flight_departure_date
ORDER BY af.flight_id,ati.flight_departure_date;

select f.flight_id, f.from_location, f.to_location, f.total_seats, f.total_seats-d.available_seats as No_of_seat_booked from air_flight f
join air_flight_details d on d.flight_id = f.flight_id
where f.total_seats-d.available_seats > f.total_seats*0.1
order by f.flight_id asc, No_of_seat_booked asc;

select d.flight_id, d.flight_departure_date, f.from_location, f.to_location, f.duration from air_flight f
join air_flight_details d on d.flight_id = f.flight_id
where duration<"01:10:00";

SELECT afd.flight_id,af.from_location,af.to_location,
count(afd.flight_departure_date) No_of_Service, avg(price) Average_Price 
FROM air_flight af JOIN air_flight_details afd ON af.flight_id=afd.flight_id
GROUP BY af.flight_id,af.from_location,af.to_location
HAVING avg(price)>(SELECT avg(price) FROM air_flight_details)
ORDER BY average_price;