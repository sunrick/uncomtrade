module Uncomtrade

  class Options

    attr_reader :options

    def initialize(opts={})
      set_options(opts)
    end

    def update(opts={})
      opts.each do |key, value|
        self.options[key] = value
      end
    end

    def reset
      set_options
    end

    def list_options
      options
    end

    private

    def set_options(options={})
      options[:max] ||= 500
      options[:fmt] ||= 'json'
      options[:r] ||= 'all'
      options[:freq] ||= 'A'
      options[:ps] ||= 'now'
      options[:px] ||= 'HS'
      options[:p] ||= 0
      options[:rg] ||= 'all'
      options[:cc] ||= 'TOTAL'
      options[:type] ||= 'C'
      @options = options
    end

  end

end