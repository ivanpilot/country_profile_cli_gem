class CountryProfileCliGem::Indicator

  attr_accessor :name, :country, :time_period

  def initialize(country, name, time_period = nil)
    @country = country
    @name = name
    @time_period = time_period
  end

  def standard_indicators
    uri = URI.parse("http://api.worldbank.org/countries/" + self.country + "?format=json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)

    {
      country_name: json[1][0]["name"],
      country_isocode: json[1][0]["id"],
      capital_city: json[1][0]["capitalCity"],
      longitude: json[1][0]["longitude"],
      latitude: json[1][0]["latitude"],
    }
  end

  def macro_indicators
    uri = URI.parse("http://api.worldbank.org/countries/" + self.country + "/indicators/" + indicator + "?date=2014:2014&format=json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
  end

end
