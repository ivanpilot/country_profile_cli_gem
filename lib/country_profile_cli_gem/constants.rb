module CountryProfileCliGem

  LAND_AREA = "AG.LND.TOTL.K2"
  TOTAL_POPULATION = "SP.POP.TOTL"
  FEMALE_POPULATION = "SP.POP.TOTL.FE.ZS"
  POPULATION_DENSITY = "EN.POP.DNST"
  GDP = "NY.GDP.MKTP.CD"
  GDP_GROWTH = "NY.GDP.MKTP.KD.ZG"
  GDP_CAPITA = "NY.GDP.PCAP.CD"
  LABOR_FORCE = "SL.TLF.TOTL.IN"
  UNEMPLOYMENT_RATE = "SL.UEM.TOTL.ZS"

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
end
