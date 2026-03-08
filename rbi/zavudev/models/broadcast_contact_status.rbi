# typed: strong

module Zavudev
  module Models
    # Status of a contact within a broadcast.
    module BroadcastContactStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Zavudev::BroadcastContactStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Zavudev::BroadcastContactStatus::TaggedSymbol)
      QUEUED = T.let(:queued, Zavudev::BroadcastContactStatus::TaggedSymbol)
      SENDING = T.let(:sending, Zavudev::BroadcastContactStatus::TaggedSymbol)
      DELIVERED =
        T.let(:delivered, Zavudev::BroadcastContactStatus::TaggedSymbol)
      FAILED = T.let(:failed, Zavudev::BroadcastContactStatus::TaggedSymbol)
      SKIPPED = T.let(:skipped, Zavudev::BroadcastContactStatus::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Zavudev::BroadcastContactStatus::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
