# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#update
      class BrandUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!attribute city
        #
        #   @return [String, nil]
        optional :city, String

        # @!attribute company_name
        #
        #   @return [String, nil]
        optional :company_name, String, api_name: :companyName

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute display_name
        #
        #   @return [String, nil]
        optional :display_name, String, api_name: :displayName

        # @!attribute ein
        #
        #   @return [String, nil]
        optional :ein, String

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute entity_type
        #   Business entity type for 10DLC brand registration.
        #
        #   @return [Symbol, Zavudev::Models::Number10dlc::BrandUpdateParams::EntityType, nil]
        optional :entity_type,
                 enum: -> { Zavudev::Number10dlc::BrandUpdateParams::EntityType },
                 api_name: :entityType

        # @!attribute first_name
        #
        #   @return [String, nil]
        optional :first_name, String, api_name: :firstName

        # @!attribute last_name
        #
        #   @return [String, nil]
        optional :last_name, String, api_name: :lastName

        # @!attribute phone
        #
        #   @return [String, nil]
        optional :phone, String

        # @!attribute postal_code
        #
        #   @return [String, nil]
        optional :postal_code, String, api_name: :postalCode

        # @!attribute state
        #
        #   @return [String, nil]
        optional :state, String

        # @!attribute stock_exchange
        #
        #   @return [String, nil]
        optional :stock_exchange, String, api_name: :stockExchange

        # @!attribute stock_symbol
        #
        #   @return [String, nil]
        optional :stock_symbol, String, api_name: :stockSymbol

        # @!attribute street
        #
        #   @return [String, nil]
        optional :street, String

        # @!attribute vertical
        #
        #   @return [String, nil]
        optional :vertical, String

        # @!attribute website
        #
        #   @return [String, nil]
        optional :website, String

        # @!method initialize(brand_id:, city: nil, company_name: nil, country: nil, display_name: nil, ein: nil, email: nil, entity_type: nil, first_name: nil, last_name: nil, phone: nil, postal_code: nil, state: nil, stock_exchange: nil, stock_symbol: nil, street: nil, vertical: nil, website: nil, request_options: {})
        #   @param brand_id [String]
        #
        #   @param city [String]
        #
        #   @param company_name [String]
        #
        #   @param country [String]
        #
        #   @param display_name [String]
        #
        #   @param ein [String]
        #
        #   @param email [String]
        #
        #   @param entity_type [Symbol, Zavudev::Models::Number10dlc::BrandUpdateParams::EntityType] Business entity type for 10DLC brand registration.
        #
        #   @param first_name [String]
        #
        #   @param last_name [String]
        #
        #   @param phone [String]
        #
        #   @param postal_code [String]
        #
        #   @param state [String]
        #
        #   @param stock_exchange [String]
        #
        #   @param stock_symbol [String]
        #
        #   @param street [String]
        #
        #   @param vertical [String]
        #
        #   @param website [String]
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

        # Business entity type for 10DLC brand registration.
        module EntityType
          extend Zavudev::Internal::Type::Enum

          PRIVATE_PROFIT = :PRIVATE_PROFIT
          PUBLIC_PROFIT = :PUBLIC_PROFIT
          NON_PROFIT = :NON_PROFIT
          GOVERNMENT = :GOVERNMENT
          SOLE_PROPRIETOR = :SOLE_PROPRIETOR

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
