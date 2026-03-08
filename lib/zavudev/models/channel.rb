# frozen_string_literal: true

module Zavudev
  module Models
    # Delivery channel. Use 'auto' for intelligent routing.
    module Channel
      extend Zavudev::Internal::Type::Enum

      AUTO = :auto
      SMS = :sms
      SMS_ONEWAY = :sms_oneway
      WHATSAPP = :whatsapp
      TELEGRAM = :telegram
      EMAIL = :email
      INSTAGRAM = :instagram
      VOICE = :voice

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
