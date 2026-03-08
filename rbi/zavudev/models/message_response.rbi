# typed: strong

module Zavudev
  module Models
    class MessageResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageResponse, Zavudev::Internal::AnyHash)
        end

      sig { returns(Zavudev::Message) }
      attr_reader :message

      sig { params(message: Zavudev::Message::OrHash).void }
      attr_writer :message

      sig do
        params(message: Zavudev::Message::OrHash).returns(T.attached_class)
      end
      def self.new(message:)
      end

      sig { override.returns({ message: Zavudev::Message }) }
      def to_hash
      end
    end
  end
end
