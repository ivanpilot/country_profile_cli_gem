Class relationships
  CLI class (Menu options): a CLI has many Country
  Country class: a Country has one Output and many Indicator. A Country belongs to a CLI
  Output class: an Output belongs to a Country
  Indicator class: An Indicator belongs to a Country
  Scraper class: Independent class
  CountryError Class: Independent class


Class definition

  CLI class
    When the overall program is launched
      It automatically instantiates a CLI object
      It automatically loads the countries list
    Only one instance of the CLI class will be created during the program working
    It handles the menu options to interact with the user

  Country class
    A country belongs to a CLI
    A country has many indicators and only one output
    A country has a name attribute, optionally an indicator attribute
    It returns the list of countries available in the World Bank database (calls the scrapper class)
    It returns the standard indicators for a country
    It returns the macro_indicators for a country
    It returns the history of an indicator for the country over a specified period of time


  Output class
    An output belongs to a county. For each country object created, only one output instance will be created
    since there will be only one output per country, methods should be only class methods
    It displays the list of countries (#display_country_list)
    It displays the standard indicators (#display_standard_indicators)
    It displays the macro indicators (#display_macro_indicators)
    It displays the time series for a given indicator (#display_time_series)

  Indicator class
    An indicator belongs to a country
    An indicator has a name attribute, a country attribute and a time period attribute
    An indicator will go to the World Bank API to retrieve the appropriate data and return the data collected

  Scrapper class
    It scraps an HTML page from the World Bank website to associate a country name with its corresponding 3-letters isocode
    It returns the list of countries under a hash table format for which the key is a country name and the value is the isocode of this particular country

  CountryError class
    It defines a customized error in case no data are available for a country despite this country belonging to the World Bank database


  TimeSeries class >> this must be in fact an attribute of the indicator class
