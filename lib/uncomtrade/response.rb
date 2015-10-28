require 'pry'
require_relative 'helpers/iterator'

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

    def cherry_pick(*selectors)
      iterator = Helpers::Iterator.new(dataset)
      iterator.cherry_pick(selectors)
    end


    attr_reader :response

  end

end