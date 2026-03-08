# frozen_string_literal: true

module Zavudev
  module Models
    module PhoneNumberType
      extend Zavudev::Internal::Type::Enum

      LOCAL = :local
      MOBILE = :mobile
      TOLL_FREE = :tollFree

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
