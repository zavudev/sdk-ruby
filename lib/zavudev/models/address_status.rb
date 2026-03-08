# frozen_string_literal: true

module Zavudev
  module Models
    module AddressStatus
      extend Zavudev::Internal::Type::Enum

      PENDING = :pending
      VERIFIED = :verified
      REJECTED = :rejected

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
