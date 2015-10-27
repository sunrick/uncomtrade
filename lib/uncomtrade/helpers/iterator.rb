module Uncomtrade
  module Helpers

    class Iterator

      def initialize(array)
        @array = array
      end

      def cherry_pick(selectors)
        selectors = convert(selectors)
        result = []
        array.each do |data|
          hash = create_hash(data, selectors)
          result.push(hash)
        end
        result
      end

      private

      attr_reader :array

      def convert(selectors)
        if selectors.is_a?(String) || selectors.is_a?(Fixnum)
          selectors = [selectors]
        elsif !selectors.empty? && selectors.is_a?(Array)
          selectors
        end
      end

      def create_hash(data, selectors)
        hash = {}
        selectors.each do |selector|
          hash.merge!({selector => data[selector]})
        end
        hash
      end

    end

  end
end