# typed: strong

module Zavudev
  module Models
    module MessageStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::MessageStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      QUEUED = T.let(:queued, Zavudev::MessageStatus::TaggedSymbol)
      SENDING = T.let(:sending, Zavudev::MessageStatus::TaggedSymbol)
      SENT = T.let(:sent, Zavudev::MessageStatus::TaggedSymbol)
      DELIVERED = T.let(:delivered, Zavudev::MessageStatus::TaggedSymbol)
      FAILED = T.let(:failed, Zavudev::MessageStatus::TaggedSymbol)
      RECEIVED = T.let(:received, Zavudev::MessageStatus::TaggedSymbol)
      PENDING_URL_VERIFICATION =
        T.let(:pending_url_verification, Zavudev::MessageStatus::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::MessageStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
