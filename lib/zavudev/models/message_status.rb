# frozen_string_literal: true

module Zavudev
  module Models
    module MessageStatus
      extend Zavudev::Internal::Type::Enum

      QUEUED = :queued
      SENDING = :sending
      SENT = :sent
      DELIVERED = :delivered
      FAILED = :failed
      RECEIVED = :received
      PENDING_URL_VERIFICATION = :pending_url_verification

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
