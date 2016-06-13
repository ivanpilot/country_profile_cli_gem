class CountryProfileCliGem::Output

  attr_reader :country

  @@all = []

  def initialize
    @@all << self
  end

  def country=(country)
    @country = country
    @country.output = self unless @country.output == self
  end

  def display_country_list
    country_hash = CountryProfileCliGem::Country.load_country_list
    country_hash.each do |name, isocode|
      puts "#{name}"
    end
  end

  def output_standard_indicators
    self.country.create_indicator("standard")
    self.country.find_indicator_by_name("standard").standard_indicators
  end

  def output_macro_indicators(indicator_name, time_period = 1)
    self.country.create_indicator(indicator_name, time_period)
    self.country.find_indicator_by_name(indicator_name).macro_indicators
  end


  def display_country_profile
    puts ""
    puts "We are collecting the data for you........ bear with us........"
    puts ""

    standard_indicators = self.output_standard_indicators
    land_area = self.output_macro_indicators(CountryProfileCliGem::LAND_AREA)
    total_population = self.output_macro_indicators(CountryProfileCliGem::TOTAL_POPULATION)
    female_population = self.output_macro_indicators(CountryProfileCliGem::FEMALE_POPULATION)
    population_density = self.output_macro_indicators(CountryProfileCliGem::POPULATION_DENSITY)
    gdp = self.output_macro_indicators(CountryProfileCliGem::GDP)
    gdp_growth = self.output_macro_indicators(CountryProfileCliGem::GDP_GROWTH)
    gdp_capita = self.output_macro_indicators(CountryProfileCliGem::GDP_CAPITA)
    labor_force = self.output_macro_indicators(CountryProfileCliGem::LABOR_FORCE)
    unemployment_rate = self.output_macro_indicators(CountryProfileCliGem::UNEMPLOYMENT_RATE)

    puts "Country name: #{standard_indicators[:country_name]}"
    puts "Country isocode: #{standard_indicators[:country_isocode]}"
    puts "Capital city: #{standard_indicators[:capital_city]}"
    puts "Country size (sq. km): #{land_area["2014"].to_i}"
    puts "Geographic coordinates: longitude(#{standard_indicators[:longitude]}), latitude(#{standard_indicators[:latitude]})"
    puts ""
    puts "----------------------------------------------------------------"
    puts ""
    puts "1. Total population (m ppl): #{total_population["2014"].to_i / 1000000}"
    puts "2. Male population (%): #{100 - female_population["2014"].to_f.round(1)}"
    puts "3. Female population (%): #{female_population["2014"].to_f.round(1)}"
    puts "4. Population density (ppl/sq. km): #{population_density["2014"].to_i}"
    puts ""
    puts "----------------------------------------------------------------"
    puts ""
    puts "5. GDP (current $US bn): #{gdp["2014"].to_i / 1000000000}"
    puts "6. GDP growth (annual %): #{gdp_growth["2014"].to_f.round(1)}"
    puts "7. GDP per capita (current $US): #{gdp_capita["2014"].to_i}"
    puts "8. Labor force (m ppl): #{labor_force["2014"].to_i / 1000000}"
    puts "9. Unemployment rate (% of total labor force): #{unemployment_rate["2014"].to_f.round(1)}"
    puts ""
    puts "----------------------------------------------------------------"
    puts ""
    puts "All data and information presented above are sourced from the World Bank database and are displayed for the year 2014."
  end

  def display_indicator_time_series(indicator_name, time_period = 1)
    indicator = self.output_macro_indicators(indicator_name, time_period)

    indicator.each do |year, value|
      puts "#{year.to_s}: #{value}"
    end

  end

  def self.all
    @@all
  end

end

# def reformat(string)
#   string.split(" ").collect {|word| word == word.capitalize ? word : word.capitalize}.join(" ")
# end
