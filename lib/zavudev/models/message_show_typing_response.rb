# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#show_typing
    class MessageShowTypingResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Zavudev::Internal::Type::Boolean

      # @!method initialize(success:)
      #   @param success [Boolean]
    end
  end
end
