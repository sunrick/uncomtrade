module Uncomtrade

  class Query
    include HTTParty
    base_uri 'http://comtrade.un.org/api/get'

    def get_data(options)
      self.class.get('', query: options)
    end

  end

end