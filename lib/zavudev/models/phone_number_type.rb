# frozen_string_literal: true

module Zavudev
  module Models
    # Type of phone number. `mobile` is stocked in countries where no geographic
    # (`local`) or non-geographic (`national`) inventory exists, and in several
    # markets it is the only type that can receive SMS.
    module PhoneNumberType
      extend Zavudev::Internal::Type::Enum

      LOCAL = :local
      NATIONAL = :national
      TOLL_FREE = :tollFree
      MOBILE = :mobile

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
