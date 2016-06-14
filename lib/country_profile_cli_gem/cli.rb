class CountryProfileCliGem::CLI

  def initialize
    @@list_available = CountryProfileCliGem::Country.load_country_list
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
      formatted_input = self.reformat_user_input(input)

      if input == 'list'
        CountryProfileCliGem::Output.display_country_list
      elsif @@list_available.key?(formatted_input.to_sym)
        @country = CountryProfileCliGem::Country.find_or_create_country_by_name(formatted_input)
        @country.output.display_country_profile
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
          :constants_key => convert_indicator(input.to_i).to_sym,
          :time_period => self.time_period
        }
        @country.output.display_indicator_time_series(time_series)
      elsif input == "exit"
        input
      else
        puts "\nI am not sure what you mean."
      end
    end
  end

  def get_user_input
    gets.strip
  end

  def reformat_user_input(initial_input)
    input_formatted = initial_input.split(" ").collect do |word|
      new_word = []
      word.split("").each_with_index {|char, index| index == 0 ? new_word << char.capitalize : new_word << char }
      new_word.join("")
    end
    input_formatted.join(" ")
  end

  def convert_indicator(number)
    CountryProfileCliGem::CONVERSION[number]
  end

  def time_period
    puts "\nHow many years of data would you would like to see? You can go back up to 40 years for certain countries (please enter a positive number)."

    input = self.get_user_input.to_i
    input < 1 || input > 40 ? self.time_period : input
  end

end
