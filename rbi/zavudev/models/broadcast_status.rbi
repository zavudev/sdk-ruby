# typed: strong

module Zavudev
  module Models
    # Current status of the broadcast.
    module BroadcastStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::BroadcastStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DRAFT = T.let(:draft, Zavudev::BroadcastStatus::TaggedSymbol)
      PENDING_REVIEW =
        T.let(:pending_review, Zavudev::BroadcastStatus::TaggedSymbol)
      APPROVED = T.let(:approved, Zavudev::BroadcastStatus::TaggedSymbol)
      REJECTED = T.let(:rejected, Zavudev::BroadcastStatus::TaggedSymbol)
      ESCALATED = T.let(:escalated, Zavudev::BroadcastStatus::TaggedSymbol)
      REJECTED_FINAL =
        T.let(:rejected_final, Zavudev::BroadcastStatus::TaggedSymbol)
      SCHEDULED = T.let(:scheduled, Zavudev::BroadcastStatus::TaggedSymbol)
      SENDING = T.let(:sending, Zavudev::BroadcastStatus::TaggedSymbol)
      PAUSED = T.let(:paused, Zavudev::BroadcastStatus::TaggedSymbol)
      COMPLETED = T.let(:completed, Zavudev::BroadcastStatus::TaggedSymbol)
      CANCELLED = T.let(:cancelled, Zavudev::BroadcastStatus::TaggedSymbol)
      FAILED = T.let(:failed, Zavudev::BroadcastStatus::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::BroadcastStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
