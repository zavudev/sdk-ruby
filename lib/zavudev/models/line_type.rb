# frozen_string_literal: true

module Zavudev
  module Models
    # Type of phone line.
    module LineType
      extend Zavudev::Internal::Type::Enum

      MOBILE = :mobile
      LANDLINE = :landline
      VOIP = :voip
      TOLL_FREE = :toll_free
      UNKNOWN = :unknown

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
