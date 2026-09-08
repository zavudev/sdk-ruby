# typed: strong

module Zavudev
  module Models
    class TemplateSyncParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::TemplateSyncParams, Zavudev::Internal::AnyHash)
        end

      # Sync only the WhatsApp Business Account attached to this sender. If omitted,
      # every WhatsApp sender in the project is synced.
      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      sig do
        params(
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Sync only the WhatsApp Business Account attached to this sender. If omitted,
        # every WhatsApp sender in the project is synced.
        sender_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { sender_id: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
