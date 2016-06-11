Class relationships
  CLI class (Menu options): a CLI has many Country
  Country class: a Country has one Output and many Indicator. A Country belongs to a CLI
  Output class: an Output belongs to a Country
  Indicator class: An Indicator belongs to a Country
  Scraper class: Independent class
  CountryError Class: Independent class


Class definition and interaction with each other

  When the program is launched, it automatically instantiates a CLI instance and call the method #call upon than newly created instance of the CLI class

  CLI class
    A CLI has many countries ??????
    Only one instance of the CLI class will be created during the program working
    It automatically loads the countries list >>> could be in the #initialize method
    It has a menu (with a loop process)
      1. list will display a list of countries stored in the World Bank database
      2. country name will display standard and macro indicators for the required country
      3. exit will exit the program
      4. anything else will continue the loop
    It has a sub menu (with a loop process)
      In case option 2. has been previously selected and country has data
      1. indicator's number and period will display the specific indicator over period wanted
      2. exit will exit the sub menu
      3. anything else will continue the loop

    #initialize loads the countries list
    #call greets the user and calls #display_menu
    #display_menu displays menu to user
    #display_sub_menu displays sub_menu to user
    #get_user_input gets user's input (PRIVATE)
    #reformat_user_input reformats user's input (PRIVATE)


  Country class
    A country belongs to a CLI
    A country has many indicators and only one output
    A country has a name attribute, optionally an indicator attribute
    It returns the list of countries available in the World Bank database (calls the scrapper class)
    It returns the standard indicators for a country
    It returns the macro_indicators for a country
    It returns the history of an indicator for the country over a specified period of time

  Output class
    An output belongs to a country. For each country object created, only one output instance will be created
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
