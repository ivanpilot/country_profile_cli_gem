# CountryProfileCliGem

The country_profile_cli_gem allows you to extract a number of key indicators for a country in order to display a country profile containing key broad indicators including for instance, population, gdp, gdp growth, etc.
Once the gem installed and running, you can choose to display the list of countries which are available, you can retrieve indicators for a specific country or zone (eg. European Union) by typing the name of the desired country (please make sure you type the name as it is showed in the list of countries) or exit the program.
If you choose to display the profile of a country, you can then, for this same country, obtain a history of a specific indicator over a period of time up to 40 years back in time. To display the historical value of a specific indicator, select the desired indicator by providing its number (range from 1 to 9 as indicated in the country profile) and indicate over how many years back in time you would want to go back. This will display the evolution of this specific indicator over the period of time you chose. Once displayed, you can either choose to display the evolution of a new indicator over a new period of time or you can exit to come back to the main menu.

All data and information are sourced from the World Bank database.
All data showed for country profile are dated 2014.
2014 are the most up to date data available for now.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'country_profile_cli_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install country_profile_cli_gem

## Usage

Run: country_profile after installing the gem

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/country_profile_cli_gem.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
ivanpilot@gmail.com
