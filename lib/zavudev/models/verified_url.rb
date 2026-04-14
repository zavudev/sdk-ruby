# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#list_verified
    class VerifiedURL < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute domain
      #   Domain extracted from the URL.
      #
      #   @return [String]
      required :domain, String

      # @!attribute status
      #   Status of a verified URL.
      #
      #   @return [Symbol, Zavudev::Models::VerifiedURL::Status]
      required :status, enum: -> { Zavudev::VerifiedURL::Status }

      # @!attribute url
      #   The verified URL.
      #
      #   @return [String]
      required :url, String

      # @!attribute approval_type
      #   How the URL was approved or rejected.
      #
      #   @return [Symbol, Zavudev::Models::VerifiedURL::ApprovalType, nil]
      optional :approval_type, enum: -> { Zavudev::VerifiedURL::ApprovalType }, api_name: :approvalType

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, created_at:, domain:, status:, url:, approval_type: nil, updated_at: nil)
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param domain [String] Domain extracted from the URL.
      #
      #   @param status [Symbol, Zavudev::Models::VerifiedURL::Status] Status of a verified URL.
      #
      #   @param url [String] The verified URL.
      #
      #   @param approval_type [Symbol, Zavudev::Models::VerifiedURL::ApprovalType] How the URL was approved or rejected.
      #
      #   @param updated_at [Time]

      # Status of a verified URL.
      #
      # @see Zavudev::Models::VerifiedURL#status
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        APPROVED = :approved
        REJECTED = :rejected
        MALICIOUS = :malicious

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # How the URL was approved or rejected.
      #
      # @see Zavudev::Models::VerifiedURL#approval_type
      module ApprovalType
        extend Zavudev::Internal::Type::Enum

        MANUAL = :manual
        AUTO_WEB_RISK = :auto_web_risk

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
