# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::RegulatoryDocuments#retrieve
    class RegulatoryDocumentRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute document_id
      #
      #   @return [String]
      required :document_id, String

      # @!method initialize(document_id:, request_options: {})
      #   @param document_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
