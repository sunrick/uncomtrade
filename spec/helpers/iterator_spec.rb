require 'spec_helper'

RSpec.describe Uncomtrade::Helpers::Iterator do

  let (:data) do
    file = File.read(File.expand_path("../../data/success_data.json", __FILE__))
    JSON.parse(file)['dataset']
  end

  it 'giving a hash with strings to cherry_pick should return the correct data' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    array = iterator.cherry_pick("period" => "year")
    expect(array).to eq([{"year" => 2014}, {"year" => 2014}])
    array = iterator.cherry_pick("period" => "Year", "rtTitle" => "Reporter")
    expect(array).to eq([{"Year" => 2014, "Reporter" => "Albania" }, 
                         {"Year" => 2014, "Reporter" => "Albania" }])
  end

  it 'giving a hash with symbols to cherry_pick should return the correct data' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    array = iterator.cherry_pick(period: "period")
    expect(array).to eq([{"period" => 2014}, {"period" => 2014}])
    array = iterator.cherry_pick(period: :year, rtTitle: :reporter)
    expect(array).to eq([{ year: 2014, reporter: "Albania" }, 
                         { year: 2014, reporter: "Albania" }])
  end

  it 'passing an empty hash should return the original array' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    array = iterator.cherry_pick({})
    expect(array).to eq(data)
  end

  it 'should write a csv file and with no selectors and data should match' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    iterator.to_csv('data.csv', {})
    file = csv_crap
    expect(file).to eq(data)
  end

  it 'should write a csv file and with selectors and data should match' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    selectors = { period: "dog" }
    iterator.to_csv('data.csv', selectors)
    array = iterator.cherry_pick(selectors)
    file = csv_crap
    expect(file).to eq(array)
  end

  ## HELPER METHODS

  def csv_crap
    CSV.new(File.read('data.csv'), headers: true, converters: :all).to_a.map do |row|
      new_hash = row.to_hash
      # LOL, ONE NUMBER IN JSON RESPONSE IS A STRING.
      # OMG I HATE LIFE
      new_hash["periodDesc"] = new_hash["periodDesc"].to_s if new_hash["periodDesc"]
      new_hash
    end
  end

end