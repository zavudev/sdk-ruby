# typed: strong

module Zavudev
  module Models
    # Status of a contact within a broadcast.
    #
    # - `pending`, `queued`, `sending`: not handed to the provider yet.
    # - `sent`: accepted by the provider; delivery is not confirmed yet. Channels that
    #   never report delivery leave the recipient here.
    # - `delivered`: the channel confirmed delivery to the device. A WhatsApp read
    #   receipt also counts as delivered.
    # - `failed`: not delivered. A recipient can move from `sent` or `delivered` to
    #   `failed` when the provider reports a failure late.
    # - `skipped`: not sent, because the recipient opted out of the channel or the
    #   broadcast was cancelled before reaching it.
    module BroadcastContactStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Zavudev::BroadcastContactStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Zavudev::BroadcastContactStatus::TaggedSymbol)
      QUEUED = T.let(:queued, Zavudev::BroadcastContactStatus::TaggedSymbol)
      SENDING = T.let(:sending, Zavudev::BroadcastContactStatus::TaggedSymbol)
      SENT = T.let(:sent, Zavudev::BroadcastContactStatus::TaggedSymbol)
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
