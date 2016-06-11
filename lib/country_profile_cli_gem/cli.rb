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

end
