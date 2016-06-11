Class relationships
  CLI class (Menu options): a CLI has many Country
  Country class: a Country has one Output and many Indicator. A Country belongs to a CLI
  Output class: an Output belongs to a Country
  Indicator class: an Indicator has one / many[?????] TimeSeries. An Indicator belongs to a Country
  TimeSeries class: a TimeSeries belongs to an Indicator


Class definition

  CLI class
    When the overall program is launched, it automatically instantiates a CLI object
    Only one instance of the CLI class will created during the program working
    It handles the menu options to interact with the user

  Country class


  Output class
    An output belongs to a county. For each country object created, only one output instance will be created >>> may be the methods should be only class methods then since there will be only one output per country
    It displays the list of countries (#display_country_list)
    It displays the standard indicators (#display_standard_indicators)
    It displays the macro indicators (#display_macro_indicators)
    It displays the time series for a given indicator (#display_time_series)

  Indicator class


  TimeSeries class
    A time_series object belongs to one specific indicator
    A time_series object has a country attribute, an indicator attribute and period attribute
    It retrieve an array or hash  
