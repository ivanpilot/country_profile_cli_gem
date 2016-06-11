class CountryProfileCliGem::CLI

  def initialize
    puts "I will load the list of countries"
    CountryProfileCliGem::Country.load_country_list
    puts "list of countries loaded"
  end

  def call
    puts "Welcome to Country Profile Gem"
    self.display_menu
  end

  def display_menu
    input = nil

    until input == "exit"
      puts "\nPlease, provide a country name or type \'list\' to get all the countries available in the database or type \'exit\'"
      input = self.get_user_input

      if input == 'list'
        puts "this is the list of countries"
      elsif input == 'country name'
        puts "these are the standard and macro indicators for 2014"
        self.display_sub_menu
      elsif input == 'exit'
        input
      else
        puts "\nI am not sure what you mean."
      end
    end

    puts "\nSee you soon!"
  end

  def display_sub_menu
    input = nil

    until input == "exit"
      puts "\nif you would like to know about historical data for a specific indicator over a certain period of time, enter the number of the indicator, otherwise type \'exit\'"
      input = self.get_user_input

      if input.to_i.between?(1, 9)
        time_series = {
          :indicator => input.to_i,
          :time_period => self.time_period
        }
        puts "call a method of a class passing the times_series hash"
      elsif input == "exit"
        input
      else
        puts "\nI am not sure what you mean."
      end
    end
  end

  # Private
  def get_user_input
    gets.strip
  end

  # Private
  def reformat_user_input(initial_input)
    initial_input.split(" ").collect do |word|
      new_word = []
      word.split("").each_with_index {|char, index| index == 0 ? new_word << char.capitalize : new_word << char }
      new_word.join("")
    end
    input_formatted.join(" ")
  end

  def time_period
    puts "\nHow many years of data would you would like to see? You can go back up to 40 years for certain countries."

    input = self.get_user_input.to_i
    input < 2 || input > 40 ? self.time_period : input
  end
end
