module Uncomtrade

  class Options

    def initialize(options={})
      set_options(options)
    end

    def update(options={})
      self.options[:max] = options[:max] if options[:max]
      self.options[:fmt] = options[:fmt] if options[:fmt]
      self.options[:r] = options[:r] if options[:r]
      self.options[:freq] = options[:freq] if options[:freq]
      self.options[:ps] = options[:ps] if options[:ps]
      self.options[:px] = options[:px] if options[:px]
      self.options[:p] = options[:p] if options[:p]
      self.options[:rg] = options[:rg] if options[:rg]
      self.options[:cc] = options[:cc] if options[:cc]
      self.options[:type] = options[:type] if options[:type]
      self.options
    end

    def reset
      set_options
    end

    def list_options
      options
    end

    private

    attr_reader :options

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