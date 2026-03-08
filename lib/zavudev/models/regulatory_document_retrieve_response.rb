# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::RegulatoryDocuments#retrieve
    class RegulatoryDocumentRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute document
      #   A regulatory document for phone number requirements.
      #
      #   @return [Zavudev::Models::RegulatoryDocument]
      required :document, -> { Zavudev::RegulatoryDocument }

      # @!method initialize(document:)
      #   @param document [Zavudev::Models::RegulatoryDocument] A regulatory document for phone number requirements.
    end
  end
end
