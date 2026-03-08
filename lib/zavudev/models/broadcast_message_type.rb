# frozen_string_literal: true

module Zavudev
  module Models
    # Type of message for broadcast.
    module BroadcastMessageType
      extend Zavudev::Internal::Type::Enum

      TEXT = :text
      IMAGE = :image
      VIDEO = :video
      AUDIO = :audio
      DOCUMENT = :document
      TEMPLATE = :template

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
