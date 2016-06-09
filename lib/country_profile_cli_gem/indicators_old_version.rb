require_relative "../country_profile_cli_gem"
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

  def valid_basic_data(type)
    # self.request_basic_data[1][0][type]
    # binding.pry
    if self.request_basic_data[0]["message"][0]["id"] == "120"
      # raise CountryProfileCliGem::CountryError
      begin
        raise CountryProfileCliGem::CountryError
      rescue CountryProfileCliGem::CountryError => error
        puts error.message
      end
    else
      self.request_basic_data[1][0][type]
    end
  end

  def valid_indicator_data(indicator)
    uri = self.url_indicator(indicator)
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)

    if json[0]["message"][0]["id"] == "120"
      # raise CountryProfileCliGem::CountryError
      begin
        raise CountryProfileCliGem::CountryError
      rescue CountryProfileCliGem::CountryError => error
        puts error.message
      end
    else
      json[1][0]["value"]
    end
  end

  def country_profile
    hash = {
      country_name: self.valid_basic_data("name"),
      country_isocode: self.valid_basic_data("id"),
      capital_city: self.valid_basic_data("capitalCity"),
      country_size: self.valid_indicator_data(LAND_AREA).to_i,
      longitude: self.valid_basic_data("longitude"),
      latitude: self.valid_basic_data("latitude"),
      total_population: self.valid_indicator_data(TOTAL_POPULATION).to_i,
      male_population: 100 * (1.00 - self.valid_indicator_data(FEMALE_POPULATION).to_f / 100),
      female_population: self.valid_indicator_data(FEMALE_POPULATION).to_f,
      population_density: self.valid_indicator_data(POPULATION_DENSITY).to_i,
      gdp: self.valid_indicator_data(GDP).to_i,
      gdp_growth: self.valid_indicator_data(GDP_GROWTH).to_f,
      gdp_per_capita: self.valid_indicator_data(GDP_CAPITA).to_i,
      labor_force: self.valid_indicator_data(LABOR_FORCE).to_i,
      unemployment_rate: self.valid_indicator_data(UNEMPLOYMENT_RATE).to_f
    }
    # binding.pry
    # puts hash
  end

end

brazil = CountryProfileCliGem::Indicators.new("yug")
brazil.country_profile
