# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#list
      class TenDlcBrand < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute city
        #
        #   @return [String]
        required :city, String

        # @!attribute country
        #   Two-letter ISO country code.
        #
        #   @return [String]
        required :country, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

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
        #   @return [Symbol, Zavudev::Models::Number10dlc::TenDlcBrand::EntityType]
        required :entity_type,
                 enum: -> {
                   Zavudev::Number10dlc::TenDlcBrand::EntityType
                 },
                 api_name: :entityType

        # @!attribute phone
        #   Contact phone number in E.164 format.
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

        # @!attribute status
        #   Status of a 10DLC brand registration.
        #
        #   @return [Symbol, Zavudev::Models::Number10dlc::TenDlcBrand::Status]
        required :status, enum: -> { Zavudev::Number10dlc::TenDlcBrand::Status }

        # @!attribute street
        #
        #   @return [String]
        required :street, String

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute vertical
        #   Industry vertical.
        #
        #   @return [String]
        required :vertical, String

        # @!attribute brand_relationship
        #
        #   @return [String, nil]
        optional :brand_relationship, String, api_name: :brandRelationship, nil?: true

        # @!attribute brand_score
        #   Trust score assigned by TCR after vetting.
        #
        #   @return [Integer, nil]
        optional :brand_score, Integer, api_name: :brandScore, nil?: true

        # @!attribute company_name
        #   Legal company name.
        #
        #   @return [String, nil]
        optional :company_name, String, api_name: :companyName, nil?: true

        # @!attribute ein
        #   Employer Identification Number (EIN).
        #
        #   @return [String, nil]
        optional :ein, String, nil?: true

        # @!attribute failure_reason
        #   Reason for rejection, if applicable.
        #
        #   @return [String, nil]
        optional :failure_reason, String, api_name: :failureReason, nil?: true

        # @!attribute first_name
        #
        #   @return [String, nil]
        optional :first_name, String, api_name: :firstName, nil?: true

        # @!attribute last_name
        #
        #   @return [String, nil]
        optional :last_name, String, api_name: :lastName, nil?: true

        # @!attribute stock_exchange
        #
        #   @return [String, nil]
        optional :stock_exchange, String, api_name: :stockExchange, nil?: true

        # @!attribute stock_symbol
        #
        #   @return [String, nil]
        optional :stock_symbol, String, api_name: :stockSymbol, nil?: true

        # @!attribute submitted_at
        #
        #   @return [Time, nil]
        optional :submitted_at, Time, api_name: :submittedAt, nil?: true

        # @!attribute verified_at
        #
        #   @return [Time, nil]
        optional :verified_at, Time, api_name: :verifiedAt, nil?: true

        # @!attribute website
        #
        #   @return [String, nil]
        optional :website, String, nil?: true

        # @!method initialize(id:, city:, country:, created_at:, display_name:, email:, entity_type:, phone:, postal_code:, state:, status:, street:, updated_at:, vertical:, brand_relationship: nil, brand_score: nil, company_name: nil, ein: nil, failure_reason: nil, first_name: nil, last_name: nil, stock_exchange: nil, stock_symbol: nil, submitted_at: nil, verified_at: nil, website: nil)
        #   @param id [String]
        #
        #   @param city [String]
        #
        #   @param country [String] Two-letter ISO country code.
        #
        #   @param created_at [Time]
        #
        #   @param display_name [String] Display name of the brand.
        #
        #   @param email [String]
        #
        #   @param entity_type [Symbol, Zavudev::Models::Number10dlc::TenDlcBrand::EntityType] Business entity type for 10DLC brand registration.
        #
        #   @param phone [String] Contact phone number in E.164 format.
        #
        #   @param postal_code [String]
        #
        #   @param state [String]
        #
        #   @param status [Symbol, Zavudev::Models::Number10dlc::TenDlcBrand::Status] Status of a 10DLC brand registration.
        #
        #   @param street [String]
        #
        #   @param updated_at [Time]
        #
        #   @param vertical [String] Industry vertical.
        #
        #   @param brand_relationship [String, nil]
        #
        #   @param brand_score [Integer, nil] Trust score assigned by TCR after vetting.
        #
        #   @param company_name [String, nil] Legal company name.
        #
        #   @param ein [String, nil] Employer Identification Number (EIN).
        #
        #   @param failure_reason [String, nil] Reason for rejection, if applicable.
        #
        #   @param first_name [String, nil]
        #
        #   @param last_name [String, nil]
        #
        #   @param stock_exchange [String, nil]
        #
        #   @param stock_symbol [String, nil]
        #
        #   @param submitted_at [Time, nil]
        #
        #   @param verified_at [Time, nil]
        #
        #   @param website [String, nil]

        # Business entity type for 10DLC brand registration.
        #
        # @see Zavudev::Models::Number10dlc::TenDlcBrand#entity_type
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

        # Status of a 10DLC brand registration.
        #
        # @see Zavudev::Models::Number10dlc::TenDlcBrand#status
        module Status
          extend Zavudev::Internal::Type::Enum

          DRAFT = :draft
          PENDING = :pending
          VERIFIED = :verified
          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
