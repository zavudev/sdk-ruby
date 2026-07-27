# frozen_string_literal: true

module Zavudev
  module Models
    # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
    # by type).
    #
    # `location_request` asks the recipient to share their location and is
    # WhatsApp-only. It takes no `content` object — the prompt goes in `text` (max
    # 1024 characters) and the button label is fixed by WhatsApp. The recipient's
    # answer arrives as an inbound `location` message whose `content.replyToMessageId`
    # is the ID of the request.
    module MessageType
      extend Zavudev::Internal::Type::Enum

      TEXT = :text
      IMAGE = :image
      VIDEO = :video
      AUDIO = :audio
      DOCUMENT = :document
      STICKER = :sticker
      LOCATION = :location
      CONTACT = :contact
      BUTTONS = :buttons
      LIST = :list
      CTA_URL = :cta_url
      LOCATION_REQUEST = :location_request
      REACTION = :reaction
      TEMPLATE = :template

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
