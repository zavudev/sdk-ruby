# frozen_string_literal: true

module Zavudev
  module Models
    # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
    module BroadcastChannel
      extend Zavudev::Internal::Type::Enum

      SMART = :smart
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
