require 'pry'
require 'open-uri'
require 'nokogiri'
require "net/http"
require "uri"
require "json"

require_relative "./country_profile_cli_gem/version"
require_relative "./country_profile_cli_gem/constants"
require_relative "./country_profile_cli_gem/scrapper"
require_relative "./country_profile_cli_gem/error.rb"
require_relative "./country_profile_cli_gem/indicator"
require_relative "./country_profile_cli_gem/output"
require_relative "./country_profile_cli_gem/country"
require_relative "./country_profile_cli_gem/cli"
