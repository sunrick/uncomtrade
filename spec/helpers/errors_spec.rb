require 'spec_helper'

RSpec.describe Uncomtrade::CountryError do

  it 'should raise the correct message' do
    expect { raise Uncomtrade::CountryError, "una" }.
    to raise_error(Uncomtrade::CountryError, "Could not find specified country/code: una" )
  end


end