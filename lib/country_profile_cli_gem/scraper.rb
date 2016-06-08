class CountryProfileCliGem::Scraper

  def self.scrape_country_isocode
    html = open("http://wits.worldbank.org/wits/wits/witshelp/Content/Codes/Country_Codes.htm")
    doc = Nokogiri::HTML(html)
    country_array = doc.css("table td")
    hash = {}
    hash_key = nil
    country_array.collect do |country|
      if country.css(".WTN").text.strip.match(/\D+/)
        hash_key = country.css(".WTN").text.strip.to_sym
      end
      if country.css(".WTNC").text.strip.match(/\D+/) && hash_key != ""
        hash[hash_key] = country.css(".WTNC").text.strip.downcase
      end
    end
    hash
  end

end


###########  FYI  #########################
# DO NOT ERASE THE BELOW  !!!!!!!!!!!!!!!!!!!!!!!!!

# Retrieve country code in an array >> 262 item
# result_gross = country_array.collect {|country| country.search(".WTNC").text.strip}.flatten
# result_clean = result_gross.delete_if {|country_code| country_code.match(/\d+/) || country_code == ""}
# puts result_clean

# Retrieve country name in an array >> 264 item
# result_gross = country_array.collect do |country|
#   country.search(".WTN").text.strip
# end
# result_clean = result_gross.delete_if{|element| element == ""}
# puts result_clean
