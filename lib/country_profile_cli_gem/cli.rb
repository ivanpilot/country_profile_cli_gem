class CountryProfileCliGem::CLI

  # provide a list of all countries to the user
  # get the input from user
  # create a url with the user

  # attr_reader :country_hash

  def call
    puts "Welcome to Country Profile Gem"
    self.menu
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please, provide a country name or type list to get all the countries available in the database or type exit"
      input = gets.downcase.strip

      if hash_key.include?(input)
       output
      elsif input == "list"
        list_countries
      elsif input == "exit"
        input
      else
        puts "I am not sure what you mean."
      end
    end
    puts "See you soon!"
  end

  def list_countries
    @country_hash = self.country_hash
    @country_hash.each do |name, isocode|
      puts "#{name}"
    end
  end

  def country_hash
    CountryProfileCliGem::Scraper.scrape_country_isocode
  end

  def ouptput (country)
    hash = CountryProfileCliGem::Indicators.new(country)
    puts "country name: Brazil"
    puts "country alpha code: bra"
    puts "Capital city: Rio de Janeiro"
    puts "Country size:"
    puts "Geographic coordinates:"
    puts "----------------------"
    puts "Total population(m): 206"
    puts "Male population(%): 50"
    puts "Female population(%): 50"
    puts "Population density(ppl/sq. km):"
    puts "----------------------"
    puts "GDP($USbn):"
    puts "GDP growth(%):"
    puts "GDP per capita($US):"
    puts "Labor force(ppl m):"
    puts "Unemployment rate(% of total population):"

  end



end
