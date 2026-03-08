# typed: strong

module Zavudev
  module Models
    class PhoneNumberSearchAvailableParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::PhoneNumberSearchAvailableParams,
            Zavudev::Internal::AnyHash
          )
        end

      # Two-letter ISO country code.
      sig { returns(String) }
      attr_accessor :country_code

      # Search for numbers containing this string.
      sig { returns(T.nilable(String)) }
      attr_reader :contains

      sig { params(contains: String).void }
      attr_writer :contains

      # Maximum number of results to return.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Type of phone number to search for.
      sig { returns(T.nilable(Zavudev::PhoneNumberType::OrSymbol)) }
      attr_reader :type

      sig { params(type: Zavudev::PhoneNumberType::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          country_code: String,
          contains: String,
          limit: Integer,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Two-letter ISO country code.
        country_code:,
        # Search for numbers containing this string.
        contains: nil,
        # Maximum number of results to return.
        limit: nil,
        # Type of phone number to search for.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            contains: String,
            limit: Integer,
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
