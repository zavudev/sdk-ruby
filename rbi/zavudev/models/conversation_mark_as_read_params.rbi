# typed: strong

module Zavudev
  module Models
    class ConversationMarkAsReadParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::ConversationMarkAsReadParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :conversation_id

      sig do
        params(
          conversation_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(conversation_id:, request_options: {})
      end

      sig do
        override.returns(
          { conversation_id: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
