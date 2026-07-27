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

      # @!attribute capabilities
      #   Comma-separated capabilities the number must have: `sms`, `voice`, `mms`.
      #   Numbers missing any of them are dropped.
      #
      #   @return [String, nil]
      optional :capabilities, String

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

      # @!method initialize(country_code:, capabilities: nil, contains: nil, limit: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::PhoneNumberSearchAvailableParams} for more details.
      #
      #   @param country_code [String] Two-letter ISO country code.
      #
      #   @param capabilities [String] Comma-separated capabilities the number must have: `sms`, `voice`, `mms`. Number
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
