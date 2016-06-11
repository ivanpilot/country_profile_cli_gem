require 'spec_helper'

describe 'Country' do

  describe '#initialize' do
    it 'accepts a name only and optionnally an indicator' do
      france = CountryProfileCliGem::Country.new("France")
      expect(france.name).to eq("France")
      expect(france.indicator).to eq(nil)
    end

    it 'accepts a name and an indicator' do
      france = CountryProfileCliGem::Country.new("France", "Indicator")
      expect(france.name).to eq("France")
      expect(france.indicator).to eq("Indicator")
    end
  end


end
