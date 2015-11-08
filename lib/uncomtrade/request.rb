module Uncomtrade

  class Request

    def initialize(opts={})
      @options = Options.new(opts)
      @query = Query.new
    end

    def get_data
      http_response = query.get_data(options.list_options)
      Response.new(http_response)
    end

    def reset
      options.reset
      self
    end

    def update(opts={})
      options.update(opts)
      self
    end

    def params
      options.list_options
    end

    private
    attr_reader :options, :query

  end

end