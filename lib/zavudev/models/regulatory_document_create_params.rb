# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::RegulatoryDocuments#create
    class RegulatoryDocumentCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute document_type
      #
      #   @return [Symbol, Zavudev::Models::RegulatoryDocumentCreateParams::DocumentType]
      required :document_type,
               enum: -> { Zavudev::RegulatoryDocumentCreateParams::DocumentType },
               api_name: :documentType

      # @!attribute file_size
      #
      #   @return [Integer]
      required :file_size, Integer, api_name: :fileSize

      # @!attribute mime_type
      #
      #   @return [String]
      required :mime_type, String, api_name: :mimeType

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute storage_id
      #   Storage ID from the upload-url endpoint.
      #
      #   @return [String]
      required :storage_id, String, api_name: :storageId

      # @!method initialize(document_type:, file_size:, mime_type:, name:, storage_id:, request_options: {})
      #   @param document_type [Symbol, Zavudev::Models::RegulatoryDocumentCreateParams::DocumentType]
      #
      #   @param file_size [Integer]
      #
      #   @param mime_type [String]
      #
      #   @param name [String]
      #
      #   @param storage_id [String] Storage ID from the upload-url endpoint.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      module DocumentType
        extend Zavudev::Internal::Type::Enum

        PASSPORT = :passport
        NATIONAL_ID = :national_id
        DRIVERS_LICENSE = :drivers_license
        UTILITY_BILL = :utility_bill
        TAX_ID = :tax_id
        BUSINESS_REGISTRATION = :business_registration
        PROOF_OF_ADDRESS = :proof_of_address
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
