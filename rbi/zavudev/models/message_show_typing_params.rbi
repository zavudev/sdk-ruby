# typed: strong

module Zavudev
  module Models
    class MessageShowTypingParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageShowTypingParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :message_id

      sig { returns(T.nilable(String)) }
      attr_reader :zavu_sender

      sig { params(zavu_sender: String).void }
      attr_writer :zavu_sender

      sig do
        params(
          message_id: String,
          zavu_sender: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(message_id:, zavu_sender: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            message_id: String,
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
