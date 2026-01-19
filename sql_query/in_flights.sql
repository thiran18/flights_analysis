create database in_flight;

use in_flight;
select * from flights;
select count(*) from flights;
describe flights;

-- create indexes for routes and airline_iata
CREATE INDEX idx_route ON flights(route(255));
CREATE INDEX idx_airline ON flights(airline_iata(255));

show index from flights;
EXPLAIN SELECT * FROM flights;

-- active flight count
select count(*) as acitve_flights
from flights
where is_active=1;

-- top 5 best routes
select route,count(*)as total_flights
from flights
group by route
order by total_flights desc
limit 5;

select airline_iata from flights;

-- altitude band analaysis
select altitude_bands,count(*)as flights
from flights
group by altitude_bands;

-- remove route as "UNKOWN -> UNKOWN'
select route ,count(*)as ff from flights
where route like 'UNK%' group by route;

start transaction;
delete  from flights where route like 'UNK';
commit;

select route from flights where route like 'UNK';


