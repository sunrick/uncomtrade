module Uncomtrade

  class CountryError < StandardError
    def initialize(nation)
      message = "Could not find specified country/code: #{nation}"
      super(message)
    end
  end

end