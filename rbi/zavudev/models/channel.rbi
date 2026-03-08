# typed: strong

module Zavudev
  module Models
    # Delivery channel. Use 'auto' for intelligent routing.
    module Channel
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::Channel) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      AUTO = T.let(:auto, Zavudev::Channel::TaggedSymbol)
      SMS = T.let(:sms, Zavudev::Channel::TaggedSymbol)
      SMS_ONEWAY = T.let(:sms_oneway, Zavudev::Channel::TaggedSymbol)
      WHATSAPP = T.let(:whatsapp, Zavudev::Channel::TaggedSymbol)
      TELEGRAM = T.let(:telegram, Zavudev::Channel::TaggedSymbol)
      EMAIL = T.let(:email, Zavudev::Channel::TaggedSymbol)
      INSTAGRAM = T.let(:instagram, Zavudev::Channel::TaggedSymbol)
      VOICE = T.let(:voice, Zavudev::Channel::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::Channel::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
