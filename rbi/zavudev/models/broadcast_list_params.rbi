# typed: strong

module Zavudev
  module Models
    class BroadcastListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastListParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Current status of the broadcast.
      sig { returns(T.nilable(Zavudev::BroadcastStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::BroadcastStatus::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::BroadcastStatus::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        limit: nil,
        # Current status of the broadcast.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: Zavudev::BroadcastStatus::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
