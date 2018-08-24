--
SELECT * 
FROM airports
WHERE airports.name LIKE '%Salina Cruz Naval Air Station%';

--
SELECT * 
FROM airlines
WHERE airlines.name LIKE '%May Air Xpress%';

--
SELECT COUNT(*)
FROM aircrafts
WHERE wake_size IN ('H','L');

--What is the aircraft code for 
--the aircraft that operates route id 548?
SELECT code
FROM aircrafts JOIN route_aircrafts
ON aircrafts.id = route_aircrafts.aircraft_id
WHERE route_id = '548';

--How many active ('Y') airlines are there that 
--are operating Airbus (name) aircrafts?
SELECT COUNT(DISTINCT(airlines.id))
FROM airlines,aircrafts,route_aircrafts,routes
WHERE airlines.id= routes.airline_id
AND routes.id = route_aircrafts.route_id
AND aircrafts.id = route_aircrafts.aircraft_id

AND active ='Y' AND aircrafts.name = 'Airbus';

--What is the code for the Boeing 737-900?
SELECT code
FROM aircrafts
WHERE name LIKE '%Boeing%'
AND description LIKE '%737-900%';

--What is the maximum airport elevation?
SELECT MAX(elevation)
FROM airports;

--How many active ('Y') airlines are based in the "United Kingdom"
SELECT COUNT(DISTINCT(airlines.id))
FROM airlines JOIN countries
ON airlines.country_id = countries.id
WHERE active = 'Y' 
AND countries.name = 'United Kingdom';

--What is the iata for "Pease International Tradeport" airport?
SELECT * 
FROM airports
WHERE name LIKE '%Pease International Tradeport%';

--How many routes are serviced by the aircraft that 
--have a description of "767-400"
SELECT COUNT(DISTINCT(route_id))
FROM route_aircrafts JOIN aircrafts
ON aircrafts.id = route_aircrafts.aircraft_id
WHERE description LIKE '%767-400%';

--How many aircrafts operate on route 147?
SELECT COUNT(DISTINCT(aircrafts.id))
FROM route_aircrafts JOIN aircrafts
ON aircrafts.id = route_aircrafts.aircraft_id
WHERE route_id = '147'; 

--What is the average airport elevation 
--to the nearest 2 decimal places?
SELECT AVG(elevation)
FROM airports;

--In what city is the "Kugluktuk" Airport  located
SELECT *
FROM airports
WHERE name = 'Kugluktuk';

--How many routes are there for active ('Y') 
--airlines based in Japan and China?
SELECT COUNT(routes.id)
FROM airlines, countries, routes
WHERE countries.id = airlines.country_id
AND airlines.id = routes.airline_id
AND active = 'Y' 
AND countries.name IN ('Japan','China');

--How many airports fly aircraft made by Douglas 
--(aircrafts name) have a source airport with an 
--elevation of over 1000?
SELECT COUNT(DISTINCT(airports.id))
FROM airports,routes,route_aircrafts,aircrafts
WHERE airports.id = routes.source_airport_id
AND routes.id = route_aircrafts.route_id
AND route_aircrafts.aircraft_id = aircrafts.id
AND elevation > 1000
AND aircrafts.name ='Douglas';

--How many airports are in 'Toronto' city?
SELECT COUNT(*) 
FROM airports
WHERE city = 'Toronto';

--How many routes does "Isles of Scilly Skybus" 
--have that end (destination airport) in "Irkutsk"?
SELECT COUNT(DISTINCT(routes.id))
FROM airlines,routes,airports
WHERE airlines.id = routes.airline_id
AND routes.destination_airport_id = airports.id
AND airlines.name ='Isles of Scilly Skybus'
AND airports.name LIKE '%Irkutsk%';

--How many airlines have the word 'aero' 
--in their name? Be careful about the case of 
--the word, as you will need to catch both upper and lower cases.
SELECT COUNT(*)
FROM airlines 
WHERE name LIKE '%Aero%' OR name LIKE '%aero%';

--What is the callsign for the airline called "Air Aurora"?
SELECT * 
FROM airlines
WHERE name = 'Air Aurora';

--What is the code for the aircraft Tupolev Tu-134?
SELECT * 
FROM aircrafts
WHERE name = 'Tupolev'
AND description = 'Tu-134';

--How many distinct airlines have routes 
--that originate at  Heathrow airport?
SELECT COUNT(DISTINCT(airlines.id))
FROM airlines, routes, airports
WHERE airlines.id = routes.airline_id
AND routes.source_airport_id = airports.id
AND airports.name  LIKE '%Heathrow%';

--At how many distinct destination 
--airports does Air Canada (airline) land at?

SELECT COUNT(DISTINCT(airports.id))
FROM airlines,routes,airports
WHERE airlines.id = routes.airline_id
AND routes.destination_airport_id= airports.id
AND airlines.name ='Air Canada';

--How many airlines start with the word 'Airlines' in their name?
SELECT COUNT(*)
FROM airlines 
WHERE name LIKE 'Airlines%';

--How many routes are there?
SELECT COUNT(*)
FROM routes;

--How many airlines operate out (source airport) of 
--Pearson International (airport iata code "YYZ") 
--that are active (active is "Y")
SELECT COUNT(DISTINCT(airlines.id))
FROM airlines, routes, airports
WHERE airlines.id = routes.airline_id
AND routes.source_airport_id = airports.id
AND active = 'Y'
AND airports.iata = 'YYZ';

--How many airports in a timezone name containing 
--'Asia' are used as a source airport (source_airport_id) 
--for a route that has aircraft that have a wake of 'H' or 'L'
SELECT COUNT(DISTINCT(airports.id))
FROM airports, routes, route_aircrafts,aircrafts
WHERE airports.id = routes.source_airport_id
AND routes.id = route_aircrafts.route_id
AND route_aircrafts.aircraft_id= aircrafts.id
AND timezone_name LIKE '%Asia%'
AND aircrafts.wake_size IN ('H','L');

--How many airports have an iata that start with 'Y'?
SELECT COUNT(*)
FROM airports
WHERE iata LIKE 'Y%';

--What is the name of the source airport 
--for route with an id of 163?
SELECT *
FROM airports JOIN routes
ON airports.id = routes.source_airport_id
WHERE routes.id = '163'

--What airline (name of the airline based off of the airline_id)
-- operates the route with an id of 120?
SELECT *
FROM airlines, routes
WHERE airlines.id = routes.airline_id
AND routes.id= '120';

--What's the maximum elevation for airports in 'Paris' city?
SELECT MAX(elevation)
FROM airports
WHERE city = 'Paris';








