module Uncomtrade

  class CountryError < StandardError
    def initialize(nation)
      message = "Could not find specified country/code: #{nation}"
      super(message)
    end
  end

  class ResponseError < StandardError
    attr_reader :status, :description
    def initialize(status, description, msg)
      @status = status
      @description = description
      super(msg)
    end
  end

end