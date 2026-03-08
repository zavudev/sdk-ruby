# frozen_string_literal: true

module Zavudev
  module Models
    module PhoneNumberStatus
      extend Zavudev::Internal::Type::Enum

      ACTIVE = :active
      SUSPENDED = :suspended
      PENDING = :pending

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
