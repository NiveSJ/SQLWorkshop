# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#
#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;
#
# 2: Get everything from the city table
# select * from city;
#
#
# 3: Get everything on the cities whose district is "aceh"
# select * from city where District = "aceh";
#
#
# 4: Get only the name of the cities where the countrycode is "bfa"
#  select Name from city where CountryCode = "bfa";
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
select name , District from city where CountryCode="tto"; 
#
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
select name as nm, District as dist from city where CountryCode= "arm";

#
#
# 7: Get the cities with a name that starts with "bor"

select name from city where name like "bor%";
#
#
# 8: Get the cities with a name that contains the string "orto"
select name from city where name like "%orto%";
#
#
# 9: Get the cities that has a population below 1000
 select population from city where population < 1000;
#
#
# 10: Get the unique countrycodes from the cities that has a population below 1000

 select distinct CountryCode from city where population < 1000;
#
#
# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
select name,Countrycode,population from city where Countrycode= "UKR" and population > 1000000;
#
#
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)

select name,Population from city where population < 200 or Population > 9500000;
#
#
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM

select name,CountryCode from city where CountryCode in ("TJK","MRT","AND","PNG","SJM");
#
#
# 14: Get the cities with a population between 200 and 700 inclusive
#
select name,population from city where population between 200 and 700;

# 15: Get the countries with a population between 8000 and 20000 inclusive

  select Name,Population from country where Population between 8000 and 20000;
#
# 16: Get the name of the countries with a independence year (indepyear) before year 0

select name, IndepYear from country where Indepyear < 0;


#
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
# select name, IndepYear,population from country where Indepyear is null and population > 1000000;
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy

select * from country where SurfaceArea < 10 and LifeExpectancy is not null;
#
