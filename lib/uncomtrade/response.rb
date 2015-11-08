require_relative 'helpers/iterator'

module Uncomtrade

  class Response

    def initialize(response)
      @response = JSON.parse(response.body)
      @iterator = Helpers::Iterator.new(dataset)
    end

    def result
      response
    end

    def dataset
      response["dataset"]
    end

    def cherry_pick(options={})
      iterator.cherry_pick(selectors)
    end

    def to_csv(file:, selectors: {})
      iterator.to_csv(file, selectors)
    end

    private

    attr_reader :response, :iterator

  end

end