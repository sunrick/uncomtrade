module Uncomtrade

  class Response

    def initialize(response)
      @response = JSON.parse(response.body)
    end

    def result
      response
    end
    
    def dataset
      response["dataset"]
    end

    def iterate(array=[])
      unless array.empty?

      end
    end

    private

    attr_reader :response

  end

end