class CountryProfileCliGem::CLI

  def call
    puts "Welcome to Country Profile Gem"
    self.menu
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nPlease, provide a country name or type list to get all the countries available in the database or type exit"
      input = gets.strip

      if country_available?(input)
        output_country_info(input)
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
    CountryProfileCliGem::Indicators.new(isocode).country_profile
    # binding.pry
  end

  def output_country_info(country)
    if self.country_card(country).class != Hash
      begin
        raise CountryProfileCliGem::CountryError
      rescue CountryProfileCliGem::CountryError => error
        puts error.message
      end
    else
      hash = self.country_card(country)
      puts ""
      puts "Country name: #{hash[:country_name]}"
      puts "Country isocode: #{hash[:country_isocode]}"
      puts "Capital city: #{hash[:capital_city]}"
      puts "Country size: #{hash[:country_size]}"
      puts "Geographic coordinates: longitude(#{hash[:longitude]}), latitude(#{hash[:latitude]})"
      puts ""
      puts "-----------------------------------"
      puts ""
      puts "Total population(m ppl): #{hash[:total_population]}"
      puts "Male population(%): #{hash[:male_population]}"
      puts "Female population(%): #{hash[:female_population]}"
      puts "Population density(ppl/sq. km): #{hash[:population_density]}"
      puts ""
      puts "-----------------------------------"
      puts ""
      puts "GDP($USbn): #{hash[:gdp]}"
      puts "GDP growth(%): #{hash[:gdp_growth]}"
      puts "GDP per capita($US): #{hash[:gdp_per_capita]}"
      puts "Labor force(m ppl): #{hash[:labor_force]}"
      puts "Unemployment rate(% of total population): #{hash[:unemployment_rate]}"
    end
  end

end

# hash = {
#   france: "french",
#   england: "british",
#   italy: "italian"
# }
