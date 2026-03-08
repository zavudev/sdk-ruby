# typed: strong

module Zavudev
  module Models
    class PhoneNumberListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::PhoneNumberListParams, Zavudev::Internal::AnyHash)
        end

      # Pagination cursor.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by phone number status.
      sig { returns(T.nilable(Zavudev::PhoneNumberStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::PhoneNumberStatus::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::PhoneNumberStatus::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination cursor.
        cursor: nil,
        limit: nil,
        # Filter by phone number status.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: Zavudev::PhoneNumberStatus::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
