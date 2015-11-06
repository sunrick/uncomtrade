require 'spec_helper'

RSpec.describe Uncomtrade::Helpers::Country do

  let(:country_helper) { Uncomtrade::Helpers::Country }
  let(:netherlands) { 528 }

  it 'iso_code should return 0 if given 0' do
    expect(country_helper.iso_code(0)).to eq(0)
    expect(country_helper.iso_code("0")).to eq(0)
  end

  it 'iso_code should return 528 if given 528' do
    expect(country_helper.iso_code(528)).to eq(netherlands)
    expect(country_helper.iso_code("528")).to eq(netherlands)
  end

  it 'iso_code should return 528 if given netherlands' do
    expect(country_helper.iso_code("netherlands")).to eq(netherlands)
  end

  it 'iso_code should return 528 if given ned' do
    expect(country_helper.iso_code("NLD")).to eq(netherlands)
  end

  it 'iso_code should return 528 if given nl' do
    expect(country_helper.iso_code("nl")).to eq(netherlands)
  end

  it 'should raise an error if provided bad string' do
    expect { country_helper.iso_code("una") }.to raise_error(Uncomtrade::CountryError)
  end



end