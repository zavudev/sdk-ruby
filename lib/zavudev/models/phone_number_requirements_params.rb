# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#requirements
    class PhoneNumberRequirementsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute country_code
      #   Two-letter ISO country code. Required unless `phoneNumber` is given.
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute phone_number
      #   E.164 number from `GET /v1/phone-numbers/available`, with `+` encoded as `%2B`.
      #   Returns the requirements the purchase of that number checks. Takes precedence
      #   over `countryCode`.
      #
      #   @return [String, nil]
      optional :phone_number, String

      # @!attribute type
      #   Type of phone number (local, national, mobile, tollFree). Defaults to `local`.
      #   With `phoneNumber`, used only when the number's own requirements cannot be
      #   resolved and the country list is returned.
      #
      #   @return [Symbol, Zavudev::Models::PhoneNumberType, nil]
      optional :type, enum: -> { Zavudev::PhoneNumberType }

      # @!method initialize(country_code: nil, phone_number: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::PhoneNumberRequirementsParams} for more details.
      #
      #   @param country_code [String] Two-letter ISO country code. Required unless `phoneNumber` is given.
      #
      #   @param phone_number [String] E.164 number from `GET /v1/phone-numbers/available`, with `+` encoded as `%2B`.
      #
      #   @param type [Symbol, Zavudev::Models::PhoneNumberType] Type of phone number (local, national, mobile, tollFree). Defaults to `local`. W
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
