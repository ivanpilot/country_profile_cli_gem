class CountryProfileCliGem::CLI

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
        list_of_countries = CountryProfileCliGem::Output.country_list
        puts list_of_countries
      elsif CountryProfileCliGem::Country.new.find_by_name?(self.reformat_user_input(input)) && CountryProfileCliGem::Country.new.indicators_available?(self.reformat_user_input(input)) ##Output instantiate with a country
        puts "show country standard indicators"  ######TO BE MODIFIED
        self.display_sub_menu ####PUT A CHECK CONDItioN country exist
      elsif input == 'exit'
        input
      else
        puts "\nI am not sure what you mean."
      end
    end

    puts "\nSee you soon!"
  end

  def display_sub_menu ###REWRITE THIS FUNCTION
    if countr
  end

  def display_sub_menu
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


  # def menu
  #   input = nil
  #
  #   while input != "exit"
  #     puts "\nPlease, provide a country name or type \'list\' to get all the countries available in the database or type \'exit\'"
  #     input = gets.strip
  #     input_formatted = self.reformat_input(input)
  #
  #     if country_available?(input_formatted)
  #       return_value = output_country_info(input_formatted)
  #
  #       if return_value.class == Hash
  #         self.sub_menu
  #       end
  #     elsif input == "list"
  #       list_countries
  #     elsif input == "exit"
  #       input
  #     else
  #       puts "\nI am not sure what you mean."
  #     end
  #   end
  #   puts "\nSee you soon!"
  # end

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


  def time_series
    puts "\nPlease, provide the number of years you would like to go back in time. You can go back up to 40 years for certain countries."

    input = gets.strip.to_i
    input < 2 || input > 40 ? self.time_series : input
  end

end
