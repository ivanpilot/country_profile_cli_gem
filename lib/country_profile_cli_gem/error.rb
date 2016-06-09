class CountryProfileCliGem::CountryError < StandardError
  def message
    puts "\nThe profile for this country is not available either because no indicators are available for this country or because the country's name has been mispelled."
    puts "Please refer to the list of countries to display the proper country name."
  end
end
