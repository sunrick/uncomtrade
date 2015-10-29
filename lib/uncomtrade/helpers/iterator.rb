module Uncomtrade
  module Helpers

    class Iterator

      def initialize(array)
        @array = array
      end

      def cherry_pick(selectors)
        selectors = syms_to_strings(selectors)
        array.map do |data|
          hash = create_hash(data, selectors)
        end
      end

      private

      attr_reader :array

      def syms_to_strings(selectors)
        selectors.map do |selector|
          selector.to_s
        end
      end

      def create_hash(data, selectors)
        selectors.inject({}) do |memo, selector|
          memo.merge({selector => data[selector]})
        end
      end

    end

  end
end