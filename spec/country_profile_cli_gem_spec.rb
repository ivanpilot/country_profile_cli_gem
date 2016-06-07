require 'spec_helper'

describe CountryProfileCliGem do
  it 'has a version number' do
    expect(CountryProfileCliGem::VERSION).not_to be nil
  end

  context 'CountryProfileCliGem::CLI' do
    it 'is defined' do
      expect(CountryProfileCliGem::CLI).to be_a(Class)
    end
  end

  context CountryProfileCliGem::CLI do
    it 'Welcome the user upon call' do
      cli = CountryProfileCliGem::CLI.new
      expect {cli.call}.to output("Welcome to Country Profile Gem\n").to_stdout
    end
  end

end
