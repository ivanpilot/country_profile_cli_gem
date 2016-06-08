# require_relative "../country_profile_cli_gem"
class CountryProfileCliGem::Indicators

  LAND_AREA = "AG.LND.TOTL.K2"
  TOTAL_POPULATION = "SP.POP.TOTL"
  FEMALE_POPULATION = "SP.POP.TOTL.FE.ZS"
  POPULATION_DENSITY = "EN.POP.DNST"
  GDP = "NY.GDP.MKTP.CD"
  GDP_GROWTH = "NY.GDP.MKTP.KD.ZG"
  GDP_CAPITA = "NY.GDP.PCAP.CD"
  LABOR_FORCE = "SL.TLF.TOTL.IN"
  UNEMPLOYMENT_RATE = "SL.UEM.TOTL.ZS"

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def url_basic
    URI.parse("http://api.worldbank.org/countries/" + self.name + "?format=json")
  end

  def url_indicator(indicator)
    URI.parse("http://api.worldbank.org/countries/" + self.name + "/indicators/" + indicator + "?date=2014:2014&format=json")
  end

  def request_basic_data
    uri = self.url_basic
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
  end

  def request_indicator_data(indicator)
    uri = self.url_indicator(indicator)
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    result = json[1][0]["value"]
  end

  def country_profile
    hash = {
      country_name: self.request_basic_data[1][0]["name"],
      country_isocode: self.request_basic_data[1][0]["id"],
      capital_city: self.request_basic_data[1][0]["capitalCity"],
      country_size: self.request_indicator_data(LAND_AREA).to_i,
      longitude: self.request_basic_data[1][0]["longitude"],
      latitude: self.request_basic_data[1][0]["latitude"],
      total_population: self.request_indicator_data(TOTAL_POPULATION).to_i,
      male_population: 100 * (1.00 - self.request_indicator_data(FEMALE_POPULATION).to_f / 100),
      female_population: self.request_indicator_data(FEMALE_POPULATION).to_f,
      population_density: self.request_indicator_data(POPULATION_DENSITY).to_i,
      gdp: self.request_indicator_data(GDP).to_i,
      gdp_growth: self.request_indicator_data(GDP_GROWTH).to_f,
      gdp_per_capita: self.request_indicator_data(GDP_CAPITA).to_i,
      labor_force: self.request_indicator_data(LABOR_FORCE).to_i,
      unemployment_rate: self.request_indicator_data(UNEMPLOYMENT_RATE).to_f
    }
  end

end

# brazil = CountryProfileCliGem::Indicators.new("bra")
# brazil.country_profile
