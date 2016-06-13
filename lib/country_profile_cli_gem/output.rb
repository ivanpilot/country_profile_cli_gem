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

  def display_country_profile
    puts ""
    puts "We are collecting the data for you........ bear with us........"
    puts ""

    hash = self.country_card(country)

    puts "Country name: #{hash[:country_name]}"
    puts "Country isocode: #{hash[:country_isocode]}"
    puts "Capital city: #{hash[:capital_city]}"
    puts "Country size (sq. km): #{hash[:country_size]}"
    puts "Geographic coordinates: longitude(#{hash[:longitude]}), latitude(#{hash[:latitude]})"
    puts ""
    puts "----------------------------------------------------------------"
    puts ""
    puts "1. Total population (m ppl): #{hash[:total_population] / 1000000}"
    puts "2. Male population (%): #{hash[:male_population].round(1)}"
    puts "3. Female population (%): #{hash[:female_population].round(1)}"
    puts "4. Population density (ppl/sq. km): #{hash[:population_density]}"
    puts ""
    puts "----------------------------------------------------------------"
    puts ""
    puts "5. GDP (current $US bn): #{hash[:gdp] / 1000000000}"
    puts "6. GDP growth (annual %): #{hash[:gdp_growth].round(1)}"
    puts "7. GDP per capita (current $US): #{hash[:gdp_per_capita]}"
    puts "8. Labor force (m ppl): #{hash[:labor_force] / 1000000}"
    puts "9. Unemployment rate (% of total labor force): #{hash[:unemployment_rate].round(1)}"
    puts ""
    puts "----------------------------------------------------------------"
    puts ""
    puts "All data and information presented above are sourced from the World Bank database and are displayed for the year 2014."
  end

  def display_indicator_time_series
  end

  def output_country_info(country)
    if self.country_card(country).class != Hash
      begin
        raise CountryProfileCliGem::CountryError
      rescue CountryProfileCliGem::CountryError => error
        puts error.message
      end
    else
      puts ""
      puts "We are collecting the data for you........ bear with us........"
      puts ""

      hash = self.country_card(country)

      puts "Country name: #{hash[:country_name]}"
      puts "Country isocode: #{hash[:country_isocode]}"
      puts "Capital city: #{hash[:capital_city]}"
      puts "Country size (sq. km): #{hash[:country_size]}"
      puts "Geographic coordinates: longitude(#{hash[:longitude]}), latitude(#{hash[:latitude]})"
      puts ""
      puts "----------------------------------------------------------------"
      puts ""
      puts "1. Total population (m ppl): #{hash[:total_population] / 1000000}"
      puts "2. Male population (%): #{hash[:male_population].round(1)}"
      puts "3. Female population (%): #{hash[:female_population].round(1)}"
      puts "4. Population density (ppl/sq. km): #{hash[:population_density]}"
      puts ""
      puts "----------------------------------------------------------------"
      puts ""
      puts "5. GDP (current $US bn): #{hash[:gdp] / 1000000000}"
      puts "6. GDP growth (annual %): #{hash[:gdp_growth].round(1)}"
      puts "7. GDP per capita (current $US): #{hash[:gdp_per_capita]}"
      puts "8. Labor force (m ppl): #{hash[:labor_force] / 1000000}"
      puts "9. Unemployment rate (% of total labor force): #{hash[:unemployment_rate].round(1)}"
      puts ""
      puts "----------------------------------------------------------------"
      puts ""
      puts "All data and information presented above are sourced from the World Bank database and are displayed for the year 2014."
      hash
    end
  end

  def self.all
    @@all
  end

end

# def reformat(string)
#   string.split(" ").collect {|word| word == word.capitalize ? word : word.capitalize}.join(" ")
# end
