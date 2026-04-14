# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#create
      class BrandCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute city
        #
        #   @return [String]
        required :city, String

        # @!attribute country
        #   Two-letter ISO country code.
        #
        #   @return [String]
        required :country, String

        # @!attribute display_name
        #   Display name of the brand.
        #
        #   @return [String]
        required :display_name, String, api_name: :displayName

        # @!attribute email
        #
        #   @return [String]
        required :email, String

        # @!attribute entity_type
        #   Business entity type for 10DLC brand registration.
        #
        #   @return [Symbol, Zavudev::Models::Number10dlc::BrandCreateParams::EntityType]
        required :entity_type,
                 enum: -> { Zavudev::Number10dlc::BrandCreateParams::EntityType },
                 api_name: :entityType

        # @!attribute phone
        #   Contact phone in E.164 format.
        #
        #   @return [String]
        required :phone, String

        # @!attribute postal_code
        #
        #   @return [String]
        required :postal_code, String, api_name: :postalCode

        # @!attribute state
        #
        #   @return [String]
        required :state, String

        # @!attribute street
        #
        #   @return [String]
        required :street, String

        # @!attribute vertical
        #   Industry vertical.
        #
        #   @return [String]
        required :vertical, String

        # @!attribute company_name
        #   Legal company name.
        #
        #   @return [String, nil]
        optional :company_name, String, api_name: :companyName

        # @!attribute ein
        #   Employer Identification Number (format: XX-XXXXXXX).
        #
        #   @return [String, nil]
        optional :ein, String

        # @!attribute first_name
        #
        #   @return [String, nil]
        optional :first_name, String, api_name: :firstName

        # @!attribute last_name
        #
        #   @return [String, nil]
        optional :last_name, String, api_name: :lastName

        # @!attribute stock_exchange
        #
        #   @return [String, nil]
        optional :stock_exchange, String, api_name: :stockExchange

        # @!attribute stock_symbol
        #
        #   @return [String, nil]
        optional :stock_symbol, String, api_name: :stockSymbol

        # @!attribute website
        #
        #   @return [String, nil]
        optional :website, String

        # @!method initialize(city:, country:, display_name:, email:, entity_type:, phone:, postal_code:, state:, street:, vertical:, company_name: nil, ein: nil, first_name: nil, last_name: nil, stock_exchange: nil, stock_symbol: nil, website: nil, request_options: {})
        #   @param city [String]
        #
        #   @param country [String] Two-letter ISO country code.
        #
        #   @param display_name [String] Display name of the brand.
        #
        #   @param email [String]
        #
        #   @param entity_type [Symbol, Zavudev::Models::Number10dlc::BrandCreateParams::EntityType] Business entity type for 10DLC brand registration.
        #
        #   @param phone [String] Contact phone in E.164 format.
        #
        #   @param postal_code [String]
        #
        #   @param state [String]
        #
        #   @param street [String]
        #
        #   @param vertical [String] Industry vertical.
        #
        #   @param company_name [String] Legal company name.
        #
        #   @param ein [String] Employer Identification Number (format: XX-XXXXXXX).
        #
        #   @param first_name [String]
        #
        #   @param last_name [String]
        #
        #   @param stock_exchange [String]
        #
        #   @param stock_symbol [String]
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
