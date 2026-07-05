# frozen_string_literal: true

module Zavudev
  module Models
    # Delivery channel. Use 'auto' for intelligent routing. `whatsapp_alt` is the
    # QR-linked WhatsApp channel and is only accepted for teams with the WhatsApp
    # Alternative feature enabled; the sender must have a connected whatsapp_alt
    # session.
    module Channel
      extend Zavudev::Internal::Type::Enum

      AUTO = :auto
      SMS = :sms
      SMS_ONEWAY = :sms_oneway
      WHATSAPP = :whatsapp
      WHATSAPP_ALT = :whatsapp_alt
      TELEGRAM = :telegram
      EMAIL = :email
      INSTAGRAM = :instagram
      MESSENGER = :messenger
      VOICE = :voice

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
