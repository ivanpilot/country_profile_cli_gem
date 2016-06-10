require 'pry'
require 'open-uri'
require 'nokogiri'
require "net/http"
require "uri"
require "json"

require_relative "./country_profile_cli_gem/version"
require_relative "./country_profile_cli_gem/scraper"
require_relative "./country_profile_cli_gem/error.rb"
require_relative "./country_profile_cli_gem/indicators"
require_relative "./country_profile_cli_gem/cli"
