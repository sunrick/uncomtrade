require_relative 'helpers/country'

module Uncomtrade

  class Options

    attr_reader :options

    def initialize(opts={})
      set_options(opts)
    end

    def update(opts={})
      opts.each do |key, value|
        if [:p,:r].include?(key)
          self.options[key] = iso_code(value)
        else
          self.options[key] = value if key != :fmt # don't let user update :fmt
        end
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
      options[:fmt] = 'json' # only support json
      options[:r] = options[:r].nil? ? 'all': iso_code(options[:r])
      options[:freq] ||= 'A'
      options[:ps] ||= 'now'
      options[:px] ||= 'HS'
      options[:p] = options[:p].nil? ? 0 : iso_code(options[:p])
      options[:rg] ||= 'all'
      options[:cc] ||= 'TOTAL'
      options[:type] ||= 'C'
      @options = options
    end

    def iso_code(country)
      Helpers::Country.iso_code(country)
    end

  end

end