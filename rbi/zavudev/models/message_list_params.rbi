# typed: strong

module Zavudev
  module Models
    class MessageListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageListParams, Zavudev::Internal::AnyHash)
        end

      # Delivery channel. Use 'auto' for intelligent routing.
      sig { returns(T.nilable(Zavudev::Channel::OrSymbol)) }
      attr_reader :channel

      sig { params(channel: Zavudev::Channel::OrSymbol).void }
      attr_writer :channel

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Zavudev::MessageStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::MessageStatus::OrSymbol).void }
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :to

      sig { params(to: String).void }
      attr_writer :to

      sig do
        params(
          channel: Zavudev::Channel::OrSymbol,
          cursor: String,
          limit: Integer,
          status: Zavudev::MessageStatus::OrSymbol,
          to: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Delivery channel. Use 'auto' for intelligent routing.
        channel: nil,
        cursor: nil,
        limit: nil,
        status: nil,
        to: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: Zavudev::Channel::OrSymbol,
            cursor: String,
            limit: Integer,
            status: Zavudev::MessageStatus::OrSymbol,
            to: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
