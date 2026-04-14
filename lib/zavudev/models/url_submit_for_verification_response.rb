# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#submit_for_verification
    class URLSubmitForVerificationResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute url
      #
      #   @return [Zavudev::Models::VerifiedURL]
      required :url, -> { Zavudev::VerifiedURL }

      # @!method initialize(url:)
      #   @param url [Zavudev::Models::VerifiedURL]
    end
  end
end
