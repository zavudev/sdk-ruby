# frozen_string_literal: true

module Zavudev
  module Models
    # WhatsApp template category.
    module WhatsappCategory
      extend Zavudev::Internal::Type::Enum

      UTILITY = :UTILITY
      MARKETING = :MARKETING
      AUTHENTICATION = :AUTHENTICATION

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
