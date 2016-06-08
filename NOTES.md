Greet the user

Actions authorized for the user
User can get a list of all the countries available in the database
User can directly type the name of the country to retrieve information

make sure Rspec is working
start thinking about the cli interaction
write test around the cli interaction



bin/country_profile

Please, provide a country name or type list to get all the countries available in the database or type exit
brazil

country name: Brazil
country alpha code: bra
Capital city: Rio de Janeiro
Country size:
Geographic coordinates:
----------------------
Total population(m): 206
Male population(%): 50
Female population(%): 50
Population density(ppl/sq. km):
----------------------
GDP($USbn):
GDP growth(%):
GDP per capita($US):
Labor force(ppl m):
Unemployment rate(% of total population):

user type an input
verify if this input match a key of the hash
if country_name exists
  returns corresponding isocode
  creates a valid first part of url based in the isocode
  http://api.worldbank.org/countries/bra/indicators/

  for each indicator, create a complete url based on first url + indicator id + second part of url
  store each of the return value in an array or hash
  return this array or hash

else
  return nil
end

http://api.worldbank.org/countries/bra/indicators/NY.GDP.MKTP.CD?date=2014:2014&format=json
