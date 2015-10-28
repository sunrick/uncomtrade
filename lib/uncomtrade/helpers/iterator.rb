module Uncomtrade
  module Helpers

    class Iterator

      def initialize(array)
        @array = array
      end

      def cherry_pick(selectors)
        array.map do |data|
          hash = create_hash(data, selectors)
        end
      end

      private

      attr_reader :array

      def create_hash(data, selectors)
        selectors.inject({}) do |memo, selector|
          memo.merge({selector => data[selector]})
        end
      end

    end

  end
end