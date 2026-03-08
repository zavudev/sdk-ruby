# frozen_string_literal: true

module Zavudev
  module Models
    # Business category for WhatsApp Business profile.
    module WhatsappBusinessProfileVertical
      extend Zavudev::Internal::Type::Enum

      UNDEFINED = :UNDEFINED
      OTHER = :OTHER
      AUTO = :AUTO
      BEAUTY = :BEAUTY
      APPAREL = :APPAREL
      EDU = :EDU
      ENTERTAIN = :ENTERTAIN
      EVENT_PLAN = :EVENT_PLAN
      FINANCE = :FINANCE
      GROCERY = :GROCERY
      GOVT = :GOVT
      HOTEL = :HOTEL
      HEALTH = :HEALTH
      NONPROFIT = :NONPROFIT
      PROF_SERVICES = :PROF_SERVICES
      RETAIL = :RETAIL
      TRAVEL = :TRAVEL
      RESTAURANT = :RESTAURANT
      NOT_A_BIZ = :NOT_A_BIZ

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
