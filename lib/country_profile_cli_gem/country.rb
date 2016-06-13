class CountryProfileCliGem::Country

  attr_accessor :name, :isocode
  attr_reader :indicators, :output

  @@all = []

  def initialize(name)
    @name = name
    @isocode = @@list_available[name.to_sym]
    @indicators = []
    # @output = SHOULD IT BE INITIALIZED FIRST?????
    @@all << self
  end

  def self.load_country_list
    @@list_available = CountryProfileCliGem::Scrapper.scrape_country_isocode
  end

  def self.find_by_country_name(country_name)
    self.all.find {|country| country_name == country.name}
  end

  def self.find_or_create_by_name(country_name)
    self.find_by_country_name(country_name) ? self.find_by_country_name(country_name) : self.new(country_name)
  end

  def add_indicator(indicator)
    self.indicators << indicator unless self.indicators.include?(indicator)
    indicator.country = self unless indicator.country = self
  end

  def find_indicator_by_name(name)
    self.indicators.find {|indicator| name == indicator.name}
  end

  def create_indicator(name = "standard", time_period = 1)
    self.add_indicator(CountryProfileCliGem::Indicator.new(name, time_period))
  end

  def output=(output)
    @output = output
    output.country = self unless output.class.all.include?(self)
  end

  def self.all
    @@all
  end

  def country_profile

  end

  def macro_indicators
  end

  def specific_indicator
    # for a given indicator, returns the value of this indicator over a specific period of time
  end

end
