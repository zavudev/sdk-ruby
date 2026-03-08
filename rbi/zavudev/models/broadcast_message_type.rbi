# typed: strong

module Zavudev
  module Models
    # Type of message for broadcast.
    module BroadcastMessageType
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Zavudev::BroadcastMessageType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TEXT = T.let(:text, Zavudev::BroadcastMessageType::TaggedSymbol)
      IMAGE = T.let(:image, Zavudev::BroadcastMessageType::TaggedSymbol)
      VIDEO = T.let(:video, Zavudev::BroadcastMessageType::TaggedSymbol)
      AUDIO = T.let(:audio, Zavudev::BroadcastMessageType::TaggedSymbol)
      DOCUMENT = T.let(:document, Zavudev::BroadcastMessageType::TaggedSymbol)
      TEMPLATE = T.let(:template, Zavudev::BroadcastMessageType::TaggedSymbol)

      sig do
        override.returns(T::Array[Zavudev::BroadcastMessageType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
