module CountryProfileCliGem

  CONSTANTS = {
    :land_area => "AG.LND.TOTL.K2",
    :total_population => "SP.POP.TOTL",
    :female_population => "SP.POP.TOTL.FE.ZS",
    :male_population => "SP.POP.TOTL.FE.ZS",
    :population_density => "EN.POP.DNST",
    :gdp => "NY.GDP.MKTP.CD",
    :gdp_growth => "NY.GDP.MKTP.KD.ZG",
    :gdp_capita => "NY.GDP.PCAP.CD",
    :labor_force => "SL.TLF.TOTL.IN",
    :unemployment_rate => "SL.UEM.TOTL.ZS"
  }

  UNITS = {
    "SP.POP.TOTL" => "m ppl",
    "SP.POP.TOTL.FE.ZS" => "%",
    "EN.POP.DNST" => "ppl/sq. km",
    "NY.GDP.MKTP.CD" => "current $US bn",
    "NY.GDP.MKTP.KD.ZG" => "annual %",
    "NY.GDP.PCAP.CD" => "current $US",
    "SL.TLF.TOTL.IN" => "m ppl",
    "SL.UEM.TOTL.ZS" => "% of total labor force"
  }

  CONVERSION = {
    1 => "total_population",
    2 => "male_population",
    3 => "female_population",
    4 => "population_density",
    5 => "gdp",
    6 => "gdp_growth",
    7 => "gdp_capita",
    8 => "labor_force",
    9 => "unemployment_rate"
  }
end
