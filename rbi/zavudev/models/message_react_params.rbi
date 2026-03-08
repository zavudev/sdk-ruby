# typed: strong

module Zavudev
  module Models
    class MessageReactParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageReactParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :message_id

      # Single emoji character to react with.
      sig { returns(String) }
      attr_accessor :emoji

      sig { returns(T.nilable(String)) }
      attr_reader :zavu_sender

      sig { params(zavu_sender: String).void }
      attr_writer :zavu_sender

      sig do
        params(
          message_id: String,
          emoji: String,
          zavu_sender: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        message_id:,
        # Single emoji character to react with.
        emoji:,
        zavu_sender: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            message_id: String,
            emoji: String,
            zavu_sender: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
