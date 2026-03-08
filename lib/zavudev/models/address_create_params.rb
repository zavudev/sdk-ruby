# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Addresses#create
    class AddressCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute country_code
      #
      #   @return [String]
      required :country_code, String, api_name: :countryCode

      # @!attribute locality
      #
      #   @return [String]
      required :locality, String

      # @!attribute postal_code
      #
      #   @return [String]
      required :postal_code, String, api_name: :postalCode

      # @!attribute street_address
      #
      #   @return [String]
      required :street_address, String, api_name: :streetAddress

      # @!attribute administrative_area
      #
      #   @return [String, nil]
      optional :administrative_area, String, api_name: :administrativeArea

      # @!attribute business_name
      #
      #   @return [String, nil]
      optional :business_name, String, api_name: :businessName

      # @!attribute extended_address
      #
      #   @return [String, nil]
      optional :extended_address, String, api_name: :extendedAddress

      # @!attribute first_name
      #
      #   @return [String, nil]
      optional :first_name, String, api_name: :firstName

      # @!attribute last_name
      #
      #   @return [String, nil]
      optional :last_name, String, api_name: :lastName

      # @!method initialize(country_code:, locality:, postal_code:, street_address:, administrative_area: nil, business_name: nil, extended_address: nil, first_name: nil, last_name: nil, request_options: {})
      #   @param country_code [String]
      #   @param locality [String]
      #   @param postal_code [String]
      #   @param street_address [String]
      #   @param administrative_area [String]
      #   @param business_name [String]
      #   @param extended_address [String]
      #   @param first_name [String]
      #   @param last_name [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
