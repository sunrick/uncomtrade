require_relative 'helpers/iterator'
require_relative 'errors'

module Uncomtrade

  class Response

    def initialize(response)
      @response = JSON.parse(response.body)
      check_status!
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

    def check_status!
      status = response["validation"]["status"]["name"]
      description = response["validation"]["status"]["description"]
      message = response["validation"]["message"]
      raise ResponseError.new(status, description, message) if status != "Ok"
    end

  end

end