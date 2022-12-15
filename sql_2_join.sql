# SQL Join exercise
#
  use world;
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
   select name,Population from city where name like "ping%" order by Population ;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
 select name,Population from city where name like "ran%" order by Population desc ;
#
# 3: Count all cities
 select  count( distinct name) from city;


#
# 4: Get the average population of all cities


select avg(population) as AVG_population from city ;

#
#
# 5: Get the biggest population found in any of the cities

select max(population) as maximum_population from city;
#
# 6: Get the smallest population found in any of the cities
#
select min(population) as maximum_population from city;
#
# 7: Sum the population of all cities with a population below 10000
#
  select sum(population) from city where population < 10000 ;

# 8: Count the cities with the countrycodes MOZ and VNM

select count(*) from city where CountryCode in ("MOZ","VNM");
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#    
select count(*) as City_count ,Countrycode  from city where Countrycode in ("MOZ","VNM") group by Countrycode;

#
# 10: Get average population of cities in MOZ and VNM

select avg(population) as AVG_population,Countrycode from city where countrycode in ("MOZ","VNM") group by Countrycode ;

#
#
# 11: Get the countrycodes with more than 200 cities
#
 select count(name) as city_count,countrycode from city 
 group by countrycode 
 having count(name)> 200;



# 12: Get the countrycodes with more than 200 cities ordered by city count
#
select count(name) as city_count,countrycode from city 
 group by countrycode 
 having count(name)> 200 order by count(name);
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?

#  -- way 1 with sub query
select language from countrylanguage where countrycode in (select countrycode from city 
where population between 400 and 500);

-- Way 2 with join

select cl.language from  countrylanguage as cl join city as c on cl.CountryCode = c.CountryCode 
where c.Population between 400 and 500;

-- Mehardad solution :

SELECT language FROM city INNER JOIN countrylanguage USING (countrycode) WHERE population BETWEEN 400 AND 500;


#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and 
#the language(s) spoken in them



select c.Name as city_name,c.Population, cl.language, c.countrycode from  countrylanguage as cl join city as c on cl.CountryCode = c.CountryCode 
where c.Population between 500 and 600;

#
# 15: What names of the cities are in the same country as 
# the city with a population of 122199 (including the that city itself)

-- with subquery
select name,countrycode from city where countrycode
 in (select countrycode from city where population = 122199);

-- mehardad solution :

SELECT c2.name FROM city c1,city c2 WHERE c1.countrycode=c2.countrycode AND c1.population=122199;

#
#
# 16: What names of the cities are in the same country as the city with a population of 122199 
#(excluding the that city itself)

select name,countrycode from city where  countrycode 
 in (select countrycode from city where population = 122199)  and name not in 
 (select name from city where population = 122199);
 
 
 -- Mehardad solution:
 
 SELECT c2.name FROM city c1,city c2 WHERE c1.countrycode=c2.countrycode AND c1.population=122199 AND c2.population<>122199;
#
#
# 17: What are the city names in the country where Luanda is capital?

-- with subquery
(select name from city where countrycode in  
(select code from country where code in (select CountryCode from city where name="Luanda") ) );

-- with join
 select name,countrycode from city where countrycode in 
 (select cy.code from country as cy join city as c  on c.countrycode=cy.code where c.name= "Luanda");


-- method 3

select name,countrycode from city where countrycode in (select countrycode from city where name = "Luanda");

-- Mehardad solution 

SELECT nc.name FROM city yc,country c,city nc WHERE yc.name="luanda" AND yc.id=c.capital AND c.code=nc.countrycode;
          
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#


select name,id from city where id in (select capital from country cy where region in
 (select cy.region as r from country cy join city c on cy.code = c.CountryCode where  c.name="Yaren"));

-- Mehardad solution 

SELECT oci.name FROM city yci,country yco,country oco,city oci WHERE yci.name="Yaren" AND yci.id=yco.capital AND yco.region=oco.region AND oco.capital=oci.id;



#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga



select distinct language from countrylanguage where countrycode in (select code from country where region 
 in(select region  from country cy join city c on cy.code = c.CountryCode where  c.name="Riga"));
 
 
 -- Mehardad solution :
 
 SELECT DISTINCT language FROM city,country cc,country rc,countrylanguage cl WHERE city.name="riga" AND city.countrycode=cc.code AND cc.region=rc.region AND rc.code=cl.countrycode;
#
#
# 20: Get the name of the most populous city

 
 select name,population from city where population in (select max(population) from city) ;
 
  select name, population from world.city order by population desc limit 1;
  
  -- Mehardad solution
  SELECT cc.name,cc.population,max(mc.population) mp FROM city cc,city mc GROUP BY cc.name HAVING cc.population=mp;
 
 

 
 

 
