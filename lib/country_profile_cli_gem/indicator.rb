class CountryProfileCliGem::Indicator

  YEAR_END = 2014

  attr_accessor :name, :country, :time_period, :year_begin

  def initialize(name, country, time_period = 1)
    @name = name
    @country = country
    @time_period = time_period
    @year_begin = YEAR_END - @time_period + 1
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
    uri = URI.parse("http://api.worldbank.org/countries/" + self.country + "/indicators/" + self.name + "?date=" + self.year_begin.to_s + ":" + YEAR_END.to_s + "&format=json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    array = json[1]

    # indicator_time_series = {}
    # end_year = YEAR_END.to_i
    array.collect do |year|
      # indicator_time_series["counter".to_sym] =
      array[year]["value"]
      # end_year -= 1
    end
    # indicator_time_series
  end
  # {
  #   self.name.to_sym => json[1][0]["value"]
  # }



end

# brazil = br.new("NY.GDP.MKTP.CD", "bra", 10)
