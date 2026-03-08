# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Addresses#list
    class Address < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute country_code
      #
      #   @return [String]
      required :country_code, String, api_name: :countryCode

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute locality
      #
      #   @return [String]
      required :locality, String

      # @!attribute postal_code
      #
      #   @return [String]
      required :postal_code, String, api_name: :postalCode

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::AddressStatus]
      required :status, enum: -> { Zavudev::AddressStatus }

      # @!attribute street_address
      #
      #   @return [String]
      required :street_address, String, api_name: :streetAddress

      # @!attribute administrative_area
      #
      #   @return [String, nil]
      optional :administrative_area, String, api_name: :administrativeArea, nil?: true

      # @!attribute business_name
      #
      #   @return [String, nil]
      optional :business_name, String, api_name: :businessName, nil?: true

      # @!attribute extended_address
      #
      #   @return [String, nil]
      optional :extended_address, String, api_name: :extendedAddress, nil?: true

      # @!attribute first_name
      #
      #   @return [String, nil]
      optional :first_name, String, api_name: :firstName, nil?: true

      # @!attribute last_name
      #
      #   @return [String, nil]
      optional :last_name, String, api_name: :lastName, nil?: true

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, country_code:, created_at:, locality:, postal_code:, status:, street_address:, administrative_area: nil, business_name: nil, extended_address: nil, first_name: nil, last_name: nil, updated_at: nil)
      #   A regulatory address for phone number requirements.
      #
      #   @param id [String]
      #   @param country_code [String]
      #   @param created_at [Time]
      #   @param locality [String]
      #   @param postal_code [String]
      #   @param status [Symbol, Zavudev::Models::AddressStatus]
      #   @param street_address [String]
      #   @param administrative_area [String, nil]
      #   @param business_name [String, nil]
      #   @param extended_address [String, nil]
      #   @param first_name [String, nil]
      #   @param last_name [String, nil]
      #   @param updated_at [Time]
    end
  end
end
