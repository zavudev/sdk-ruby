# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#retrieve_details
    class URLRetrieveDetailsResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute url
      #
      #   @return [Zavudev::Models::VerifiedURL]
      required :url, -> { Zavudev::VerifiedURL }

      # @!method initialize(url:)
      #   @param url [Zavudev::Models::VerifiedURL]
    end
  end
end
