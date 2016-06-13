class CountryProfileCliGem::Country

  attr_accessor :name, :isocode
  attr_reader :indicators

  @@all = []

  def initialize(name)
    @name = name
    @isocode = @@list_available[name.to_sym]
    @indicators = []
    @@all << self
  end

  def self.load_country_list
    @@list_available = CountryProfileCliGem::Scrapper.scrape_country_isocode
  end

  def self.all
    @@all
  end

  def add_indicator(indicator)
    self.indicators << indicator unless self.indicators.include?(indicator)
    indicator.country = self unless indicator.country = self
  end

  def find_indicator_by_name(name)
    self.indicators.find {|indicator| name == indicator.name}
  end

  def country_profile
    # return a hash of all standard and macro indicator
    standard_indicators = CountryProfileCliGem::Indicator.new(self.isocode).standard_indicators

    puts result
  end

  def macro_indicators
  end

  def specific_indicator
    # for a given indicator, returns the value of this indicator over a specific period of time
  end

  def find_by_name
    #check if a country has already been searched, so you can pull out data quickly without scrapping again
  end

end
