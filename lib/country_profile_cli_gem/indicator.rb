require_relative "../country_profile_cli_gem"
# require_relative "./version"
# require 'pry'

class CountryProfileCliGem::Indicator

  YEAR_END = 2014

  attr_accessor :country, :name, :time_period, :year_begin

  def initialize(country, name = nil, time_period = 1)
    @country = country
    @name = name
    @time_period = time_period
    @year_begin = YEAR_END - @time_period + 1
  end

  def standard_indicators
    uri = URI.parse("http://api.worldbank.org/countries/" + self.country + "?format=json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    if json.count == 1
      begin
        raise CountryProfileCliGem::CountryError
      rescue CountryProfileCliGem::CountryError => error
        puts error.message
      end
    else
      {
        country_name: json[1][0]["name"],
        country_isocode: json[1][0]["id"],
        capital_city: json[1][0]["capitalCity"],
        longitude: json[1][0]["longitude"],
        latitude: json[1][0]["latitude"],
      }
    end
  end

  def macro_indicators
    uri = URI.parse("http://api.worldbank.org/countries/" + self.country + "/indicators/" + self.name + "?date=" + self.year_begin.to_s + ":" + YEAR_END.to_s + "&format=json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)

    indicator_time_series = {}
    json[1].each_with_index do |element, index|
      indicator_time_series[self.name.instance_variables + "_" + (YEAR_END - index).to_s] = element["value"]
    end
    indicator_time_series
  end

end

# br = CountryProfileCliGem::Indicator.new("bra", CountryProfileCliGem::LAND_AREA, 10)
# br.macro_indicators
# br = CountryProfileCliGem::Indicator.new("bra", CountryProfileCliGem::LAND_AREA, 10)
# br.standard_indicators
br = CountryProfileCliGem::Indicator.new("bra")
br.standard_indicators
