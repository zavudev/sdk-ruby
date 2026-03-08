# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#search_available
    class PhoneNumberSearchAvailableParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute country_code
      #   Two-letter ISO country code.
      #
      #   @return [String]
      required :country_code, String

      # @!attribute contains
      #   Search for numbers containing this string.
      #
      #   @return [String, nil]
      optional :contains, String

      # @!attribute limit
      #   Maximum number of results to return.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute type
      #   Type of phone number to search for.
      #
      #   @return [Symbol, Zavudev::Models::PhoneNumberType, nil]
      optional :type, enum: -> { Zavudev::PhoneNumberType }

      # @!method initialize(country_code:, contains: nil, limit: nil, type: nil, request_options: {})
      #   @param country_code [String] Two-letter ISO country code.
      #
      #   @param contains [String] Search for numbers containing this string.
      #
      #   @param limit [Integer] Maximum number of results to return.
      #
      #   @param type [Symbol, Zavudev::Models::PhoneNumberType] Type of phone number to search for.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
