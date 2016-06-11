class CountryProfileCliGem::Country

  attr_accessor :name, :isocode, :indicator

  @@all = []

  def initialize(name)
    @name = name
    @isocode = @@list_available[name.to_sym]
    @output = nil
    self.class.all << self
  end

  def self.load_country_list
    @@list_available = CountryProfileCliGem::Scrapper.scrape_country_isocode
  end

  def self.all
    @@all
  end

  def standard_indicators
    # return a hash of all standard and macro indicator
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
