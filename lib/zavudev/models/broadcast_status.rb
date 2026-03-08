# frozen_string_literal: true

module Zavudev
  module Models
    # Current status of the broadcast.
    module BroadcastStatus
      extend Zavudev::Internal::Type::Enum

      DRAFT = :draft
      PENDING_REVIEW = :pending_review
      APPROVED = :approved
      REJECTED = :rejected
      ESCALATED = :escalated
      REJECTED_FINAL = :rejected_final
      SCHEDULED = :scheduled
      SENDING = :sending
      PAUSED = :paused
      COMPLETED = :completed
      CANCELLED = :cancelled
      FAILED = :failed

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
