# typed: strong

module Zavudev
  module Models
    # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
    module BroadcastChannel
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::BroadcastChannel) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SMART = T.let(:smart, Zavudev::BroadcastChannel::TaggedSymbol)
      SMS = T.let(:sms, Zavudev::BroadcastChannel::TaggedSymbol)
      SMS_ONEWAY = T.let(:sms_oneway, Zavudev::BroadcastChannel::TaggedSymbol)
      WHATSAPP = T.let(:whatsapp, Zavudev::BroadcastChannel::TaggedSymbol)
      TELEGRAM = T.let(:telegram, Zavudev::BroadcastChannel::TaggedSymbol)
      EMAIL = T.let(:email, Zavudev::BroadcastChannel::TaggedSymbol)
      INSTAGRAM = T.let(:instagram, Zavudev::BroadcastChannel::TaggedSymbol)
      VOICE = T.let(:voice, Zavudev::BroadcastChannel::TaggedSymbol)

      sig do
        override.returns(T::Array[Zavudev::BroadcastChannel::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
