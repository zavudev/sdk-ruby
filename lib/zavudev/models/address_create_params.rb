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

      # @!attribute first_name
      #   First name of the person the address is registered to.
      #
      #   @return [String]
      required :first_name, String, api_name: :firstName

      # @!attribute last_name
      #   Last name of the person the address is registered to.
      #
      #   @return [String]
      required :last_name, String, api_name: :lastName

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
      #   Business name, when the address belongs to a business. Defaults to the person's
      #   full name.
      #
      #   @return [String, nil]
      optional :business_name, String, api_name: :businessName

      # @!attribute extended_address
      #
      #   @return [String, nil]
      optional :extended_address, String, api_name: :extendedAddress

      # @!method initialize(country_code:, first_name:, last_name:, locality:, postal_code:, street_address:, administrative_area: nil, business_name: nil, extended_address: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::AddressCreateParams} for more details.
      #
      #   @param country_code [String]
      #
      #   @param first_name [String] First name of the person the address is registered to.
      #
      #   @param last_name [String] Last name of the person the address is registered to.
      #
      #   @param locality [String]
      #
      #   @param postal_code [String]
      #
      #   @param street_address [String]
      #
      #   @param administrative_area [String]
      #
      #   @param business_name [String] Business name, when the address belongs to a business. Defaults to the person's
      #
      #   @param extended_address [String]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
