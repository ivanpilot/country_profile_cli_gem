class CountryProfileCliGem::CLI

  # provide a list of all countries to the user
  # get the input from user
  # create a url with the user

  # attr_accessor :all

  def call
    puts "Welcome to Country Profile Gem"
    self.get_user_input
  end

  def get_user_input
    input = nil
    while input != "exit"
      puts "Please, provide a country name or type list to get all the countries available in the database or type exit"
      input = gets.strip
      if input == "brazil"
        Parsing.new
      elsif input == "list"
        self.all
      else
        puts "I am not sure what you mean."
      end
    end
    puts "Thank you very much. See you soon."
  end

  def country_data(name)
    #call a parsing method / kind of scraping
  end

  def ouptput
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
