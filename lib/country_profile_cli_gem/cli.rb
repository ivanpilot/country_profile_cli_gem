class CountryProfileCliGem::CLI

  def call
    puts "Welcome to Country Profile Gem"
    self.menu
  end

  def menu
    input = nil

    while input != "exit"
      puts "\nPlease, provide a country name or type \'list\' to get all the countries available in the database or type \'exit\'"
      input = gets.strip
      input_formatted = self.reformat_input(input)

      if country_available?(input_formatted)
        return_value = output_country_info(input_formatted)

        if return_value.class == Hash
          self.sub_menu
        end
      elsif input == "list"
        list_countries
      elsif input == "exit"
        input
      else
        puts "\nI am not sure what you mean."
      end
    end
    puts "\nSee you soon!"
  end

  def reformat_input(string)
    result = string.strip.split(" ").collect do |word|
      new_word = []
      ddf = word.split("").each_with_index do |char, index|

        if index == 0
          new_word << char.capitalize
        else
          new_word << char
        end
      end
      new_word.join("")
    end
    result.join(" ")
  end

  def sub_menu
    input = nil
    @indicator_and_period = {}

    while input != "exit"
      puts "\nif you would like to know about historical data for a specific indicator over a certain period of time, enter the number of the indicator, otherwise type \'exit\'"
      input = gets.strip

      if input == "exit"
        input
      elsif input.to_i.between?(1, 9)
        @indicator_and_period[:indicator_number] = input.to_i
        @indicator_and_period[:indicator_period] = self.time_series
        @indicator_and_period ######THIS MUST CALL A NEW CLASS FOR TIME SERIES
        # puts "#{@indicator_and_period}" >>> MUST BE DEVELOPPED!!!!
      else
        puts "\nI am not sure what you mean."
      end
    end
    # @indicator_and_period = {}
  end

  def time_series
    puts "\nPlease, provide the number of years you would like to go back in time. You can go back up to 40 years for certain countries."

    input = gets.strip.to_i
    input < 2 || input > 40 ? self.time_series : input
  end

  def list_countries
    country_hash = self.country_hash
    country_hash.each do |name, isocode|
      puts "#{name}"
    end
  end

  def country_hash
    CountryProfileCliGem::Scraper.scrape_country_isocode
  end

  def country_available?(country)
    hash = self.country_hash
    hash.key?(country.to_sym)
  end

  def country_card(country)
    country_hash = self.country_hash
    isocode = country_hash[country.to_sym]
    CountryProfileCliGem::IndicatorsCurrentYear.new(isocode).country_profile
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

end

# def reformat(string)
#   string.split(" ").collect {|word| word == word.capitalize ? word : word.capitalize}.join(" ")
# end
