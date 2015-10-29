require 'spec_helper'

RSpec.describe Uncomtrade::Helpers::Iterator do

  let (:data) do
    file = File.read(File.expand_path("../../data/success_data.json", __FILE__))
    JSON.parse(file)['dataset']
  end

  it 'giving an array with strings to cherry_pick should return the correct data' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    array = iterator.cherry_pick(["period"])
    expect(array).to eq([{"period" => 2014}, {"period" => 2014}])
    array = iterator.cherry_pick(["period", "rtTitle"])
    expect(array).to eq([{"period" => 2014, "rtTitle" => "Albania" }, 
                         {"period" => 2014, "rtTitle" => "Albania"}])
  end

  it 'giving an array with symbols to cherry_pick should return the correct data' do
    iterator = Uncomtrade::Helpers::Iterator.new(data)
    array = iterator.cherry_pick([:period])
    expect(array).to eq([{"period" => 2014}, {"period" => 2014}])
    array = iterator.cherry_pick([:period, :rtTitle])
    expect(array).to eq([{"period" => 2014, "rtTitle" => "Albania" }, 
                         {"period" => 2014, "rtTitle" => "Albania"}])
  end

end