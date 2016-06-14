class CountryProfileCliGem::Country

  attr_accessor :name, :isocode
  attr_reader :indicators, :output

  @@all = []

  def initialize(name)
    @name = name
    @isocode = @@list_available[name.to_sym]
    @indicators = []
    @@all << self
    @output = CountryProfileCliGem::Output.new
    self.output.country = self unless self.output.country == self
  end

  def self.load_country_list
    @@list_available = CountryProfileCliGem::Scrapper.scrape_country_isocode
  end

  def self.find_by_country_name(country_name)
    self.all.find {|country| country_name == country.name}
  end

  def self.find_or_create_country_by_name(country_name)
    self.find_by_country_name(country_name) ? self.find_by_country_name(country_name) : self.new(country_name)
  end

  def add_indicator(indicator)
    self.indicators << indicator unless self.indicators.include?(indicator)
    indicator.country = self unless indicator.country = self
  end

  def find_indicator(name = "standard", time_period = 1)
    self.indicators.find {|indicator| indicator.name == name && indicator.time_period == time_period}
  end

  def create_indicator(name = "standard", time_period = 1)
    self.add_indicator(CountryProfileCliGem::Indicator.new(name, time_period))
    self.find_indicator(name, time_period)
  end

  def find_or_create_indicator(name = "standard", time_period = 1)
    self.find_indicator(name, time_period) ? self.find_indicator(name, time_period) : self.create_indicator(name, time_period)
  end

  def self.all
    @@all
  end

end
