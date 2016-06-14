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

  def self.display_country_list
    country_hash = CountryProfileCliGem::Country.load_country_list
    country_hash.each do |name, isocode|
      puts "#{name}"
    end
  end

  def output_standard_indicators
    indicators = self.country.find_or_create_indicator("standard")
    indicators.standard_indicators
  end

  def output_macro_indicators(name, time_period = 1)
    indicator = self.country.find_or_create_indicator(name, time_period)
    indicator.macro_indicators
  end


  def display_country_profile
    puts ""
    puts "We are collecting the data for you........ bear with us........"
    puts ""

    standard_indicators = self.output_standard_indicators
    land_area = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:land_area])
    total_population = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:total_population])
    female_population = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:female_population])
    population_density = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:population_density])
    gdp = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:gdp])
    gdp_growth = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:gdp_growth])
    gdp_capita = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:gdp_capita])
    labor_force = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:labor_force])
    unemployment_rate = self.output_macro_indicators(CountryProfileCliGem::CONSTANTS[:unemployment_rate])

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

  def display_indicator_time_series(constants_key:, time_period:1)
    if constants_key == "male_population".to_sym
      display_male_indicator_time_series(time_period)
    else
      display_general_indicator_time_series(CountryProfileCliGem::CONSTANTS[constants_key.to_sym], time_period)
    end
  end

  def display_male_indicator_time_series(time_period = 1)
    puts ""
    puts "We are collecting the data for you........ bear with us........"
    puts ""

    indicator = self.output_macro_indicators("SP.POP.TOTL.FE.ZS", time_period)

    puts "The evolution of the male population for #{self.country.name} over the last #{time_period} year(s): (data units are in %)"

    indicator.each do |year, value|
      puts "  #{year.to_s}: #{100 - value.to_f.round(1)}"
    end
  end

  def display_general_indicator_time_series(name, time_period = 1)
    puts ""
    puts "We are collecting the data for you........ bear with us........"
    puts ""

    indicator_name = CountryProfileCliGem::CONSTANTS.key(name).to_s
    unit = CountryProfileCliGem::UNITS[name]

    indicator = self.output_macro_indicators(name, time_period)

    puts "The evolution of the #{indicator_name} for #{self.country.name} over the last #{time_period} year(s): (data units are in #{unit})"

    amount = nil
    indicator.each do |year, value|
      amount = case unit
      when "m ppl"
        value.to_i / 1000000
      when "%"
        value.to_f.round(1)
      when "annual %"
        value.to_f.round(1)
      when "% of total labor force"
        value.to_f.round(1)
      when "ppl/sq. km"
        value.to_i
      when "current $US bn"
        value.to_i / 1000000000
      when "current $US"
        value.to_i
      end
      puts "  #{year.to_s}: #{amount}"
    end
  end

  def self.all
    @@all
  end

end

# def reformat(string)
#   string.split(" ").collect {|word| word == word.capitalize ? word : word.capitalize}.join(" ")
# end
