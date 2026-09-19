# frozen_string_literal: true

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

      PENDING = :pending
      QUEUED = :queued
      SENDING = :sending
      SENT = :sent
      DELIVERED = :delivered
      FAILED = :failed
      SKIPPED = :skipped

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
