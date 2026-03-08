# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::RegulatoryDocuments#list
    class RegulatoryDocument < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute document_type
      #
      #   @return [Symbol, Zavudev::Models::RegulatoryDocument::DocumentType]
      required :document_type, enum: -> { Zavudev::RegulatoryDocument::DocumentType }, api_name: :documentType

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::RegulatoryDocument::Status]
      required :status, enum: -> { Zavudev::RegulatoryDocument::Status }

      # @!attribute file_size
      #
      #   @return [Integer, nil]
      optional :file_size, Integer, api_name: :fileSize

      # @!attribute mime_type
      #
      #   @return [String, nil]
      optional :mime_type, String, api_name: :mimeType

      # @!attribute rejection_reason
      #
      #   @return [String, nil]
      optional :rejection_reason, String, api_name: :rejectionReason, nil?: true

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, created_at:, document_type:, name:, status:, file_size: nil, mime_type: nil, rejection_reason: nil, updated_at: nil)
      #   A regulatory document for phone number requirements.
      #
      #   @param id [String]
      #   @param created_at [Time]
      #   @param document_type [Symbol, Zavudev::Models::RegulatoryDocument::DocumentType]
      #   @param name [String]
      #   @param status [Symbol, Zavudev::Models::RegulatoryDocument::Status]
      #   @param file_size [Integer]
      #   @param mime_type [String]
      #   @param rejection_reason [String, nil]
      #   @param updated_at [Time]

      # @see Zavudev::Models::RegulatoryDocument#document_type
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

      # @see Zavudev::Models::RegulatoryDocument#status
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        UPLOADED = :uploaded
        VERIFIED = :verified
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
