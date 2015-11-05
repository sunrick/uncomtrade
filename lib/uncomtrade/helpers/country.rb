module Uncomtrade

  module Helpers

    class Country

      def self.iso_code(nation)
        if nation == "0" || nation == 0
          0 # countries gem has no number called 0, it is comtrade api number.
        else
          country = find_country(nation)
          raise "Could not find specified country. #{nation}" if country.nil?
          country.number.to_i
        end
      end

      private

      def self.find_country(nation)
        if nation.is_a?(Integer) || nation.to_i > 0 # "hello".to_i returns 0
          ISO3166::Country.find_country_by_number(nation)
        else
          ISO3166::Country.find_country_by_name(nation)   || 
          ISO3166::Country.find_country_by_alpha3(nation) || 
          ISO3166::Country.find_country_by_alpha2(nation)
        end
      end

    end

  end

end