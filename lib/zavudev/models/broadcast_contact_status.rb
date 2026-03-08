# frozen_string_literal: true

module Zavudev
  module Models
    # Status of a contact within a broadcast.
    module BroadcastContactStatus
      extend Zavudev::Internal::Type::Enum

      PENDING = :pending
      QUEUED = :queued
      SENDING = :sending
      DELIVERED = :delivered
      FAILED = :failed
      SKIPPED = :skipped

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
