# typed: strong

module Zavudev
  module Models
    class ConversationListMessagesParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::ConversationListMessagesParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :conversation_id

      # Opaque cursor from a previous response's `nextCursor`.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          conversation_id: String,
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        conversation_id:,
        # Opaque cursor from a previous response's `nextCursor`.
        cursor: nil,
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            conversation_id: String,
            cursor: String,
            limit: Integer,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
