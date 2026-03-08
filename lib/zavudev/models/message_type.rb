# frozen_string_literal: true

module Zavudev
  module Models
    # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
    # by type).
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
      REACTION = :reaction
      TEMPLATE = :template

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
