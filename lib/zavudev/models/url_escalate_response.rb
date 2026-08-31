# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#escalate
    class URLEscalateResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute url
      #
      #   @return [Zavudev::Models::VerifiedURL]
      required :url, -> { Zavudev::VerifiedURL }

      # @!method initialize(message:, url:)
      #   @param message [String]
      #   @param url [Zavudev::Models::VerifiedURL]
    end
  end
end
