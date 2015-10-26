module Uncomtrade

  class Request

    def initialize(opts={})
      @options = Options.new(opts)
      @query = Query.new
    end

    def get_data
      query.get_data(options.list_options)
    end

    def reset
      options.reset
    end

    def update(opts={})
      options.update(options)
    end

    def list_options
      options.list_options
    end

    private
    attr_reader :options, :query

  end

end