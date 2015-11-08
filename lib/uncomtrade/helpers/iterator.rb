module Uncomtrade
  module Helpers

    class Iterator

      def initialize(array)
        @array = array
      end

      def cherry_pick(selectors)
        if !selectors.empty?
          selectors = syms_to_strings(selectors)
          array.map do |data|
            hash = create_hash(data, selectors)
          end
        else
          array
        end
      end

      def to_csv(csv_path, selectors)
        CSV.open(csv_path, "wb") do |csv|
          picked_array = cherry_pick(selectors)
          csv << picked_array.first.keys
          picked_array.each do |hash|
            csv << hash.values
          end
        end
      end

      private

      attr_reader :array

      def syms_to_strings(selectors)
        selectors.map do |key, value|
          [key.to_s, value]
        end.to_h
      end

      def create_hash(data, selectors)
        selectors.inject({}) do |memo, selector|
          memo.merge({selector.last => data[selector.first]})
        end
      end

    end

  end
end