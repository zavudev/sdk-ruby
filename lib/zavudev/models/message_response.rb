# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#retrieve
    class MessageResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [Zavudev::Models::Message]
      required :message, -> { Zavudev::Message }

      # @!method initialize(message:)
      #   @param message [Zavudev::Models::Message]
    end
  end
end
