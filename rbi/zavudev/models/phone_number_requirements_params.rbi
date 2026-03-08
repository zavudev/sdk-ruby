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

      # Two-letter ISO country code.
      sig { returns(String) }
      attr_accessor :country_code

      # Type of phone number (local, mobile, tollFree).
      sig { returns(T.nilable(Zavudev::PhoneNumberType::OrSymbol)) }
      attr_reader :type

      sig { params(type: Zavudev::PhoneNumberType::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          country_code: String,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Two-letter ISO country code.
        country_code:,
        # Type of phone number (local, mobile, tollFree).
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
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
