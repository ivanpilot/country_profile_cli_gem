require "net/http"
require "uri"
require "json"

require_relative "../country_profile_cli_gem"


class CountryProfileCliGem::Indicators

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def url_base(name)
    # doc = Nokogiri::HTML(open("http://api.worldbank.org/countries/bra/indicators/NY.GDP.MKTP.CD?date=2014:2014&format=json"))
    # url = "http://api.worldbank.org/countries/bra/indicators/NY.GDP.MKTP.CD?date=2014:2014&format=json"
    # puts doc

    uri = URI.parse("http://api.worldbank.org/countries/" + name + "/indicators/NY.GDP.MKTP.CD?date=2014:2014&format=json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    result = json[1][0]["value"].to_i / 1000000000
    puts result
    # binding.pry
    #["id:"]
# :mass =>
# mass:
# "mass" =>


# puts response.body



  end

end

test1 = CountryProfileCliGem::Indicators.new("ok")
test1.url_base("bra")


# require "net/http"
# require "uri"
