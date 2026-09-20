# frozen_string_literal: true

module Zavudev
  module Models
    # Billing state of an owned number, separate from `regulatoryStatus`. `pending` is
    # legacy and is not written to numbers today. The SDKs carry `active`, `suspended`
    # and `pending` only; `releasing` and `released` are returned by the REST API
    # until their next release.
    module PhoneNumberStatus
      extend Zavudev::Internal::Type::Enum

      ACTIVE = :active
      SUSPENDED = :suspended
      PENDING = :pending
      RELEASING = :releasing
      RELEASED = :released

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
