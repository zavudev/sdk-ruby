# typed: strong

module Zavudev
  module Models
    class PhoneNumberRequirementsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::PhoneNumberRequirementsParams,
            Zavudev::Internal::AnyHash
          )
        end

      # Two-letter ISO country code. Required unless `phoneNumber` is given.
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # E.164 number from `GET /v1/phone-numbers/available`, with `+` encoded as `%2B`.
      # Returns the requirements the purchase of that number checks. Takes precedence
      # over `countryCode`.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # Type of phone number (local, national, mobile, tollFree). Defaults to `local`.
      # With `phoneNumber`, used only when the number's own requirements cannot be
      # resolved and the country list is returned.
      sig { returns(T.nilable(Zavudev::PhoneNumberType::OrSymbol)) }
      attr_reader :type

      sig { params(type: Zavudev::PhoneNumberType::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          country_code: String,
          phone_number: String,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Two-letter ISO country code. Required unless `phoneNumber` is given.
        country_code: nil,
        # E.164 number from `GET /v1/phone-numbers/available`, with `+` encoded as `%2B`.
        # Returns the requirements the purchase of that number checks. Takes precedence
        # over `countryCode`.
        phone_number: nil,
        # Type of phone number (local, national, mobile, tollFree). Defaults to `local`.
        # With `phoneNumber`, used only when the number's own requirements cannot be
        # resolved and the country list is returned.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            phone_number: String,
            type: Zavudev::PhoneNumberType::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
