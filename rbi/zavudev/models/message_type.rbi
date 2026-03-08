# typed: strong

module Zavudev
  module Models
    # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
    # by type).
    module MessageType
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::MessageType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TEXT = T.let(:text, Zavudev::MessageType::TaggedSymbol)
      IMAGE = T.let(:image, Zavudev::MessageType::TaggedSymbol)
      VIDEO = T.let(:video, Zavudev::MessageType::TaggedSymbol)
      AUDIO = T.let(:audio, Zavudev::MessageType::TaggedSymbol)
      DOCUMENT = T.let(:document, Zavudev::MessageType::TaggedSymbol)
      STICKER = T.let(:sticker, Zavudev::MessageType::TaggedSymbol)
      LOCATION = T.let(:location, Zavudev::MessageType::TaggedSymbol)
      CONTACT = T.let(:contact, Zavudev::MessageType::TaggedSymbol)
      BUTTONS = T.let(:buttons, Zavudev::MessageType::TaggedSymbol)
      LIST = T.let(:list, Zavudev::MessageType::TaggedSymbol)
      REACTION = T.let(:reaction, Zavudev::MessageType::TaggedSymbol)
      TEMPLATE = T.let(:template, Zavudev::MessageType::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::MessageType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
