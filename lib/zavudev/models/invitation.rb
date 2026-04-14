# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#list
    class Invitation < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute token
      #   Unique invitation token.
      #
      #   @return [String]
      required :token, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute expires_at
      #
      #   @return [Time]
      required :expires_at, Time, api_name: :expiresAt

      # @!attribute status
      #   Current status of the partner invitation.
      #
      #   @return [Symbol, Zavudev::Models::Invitation::Status]
      required :status, enum: -> { Zavudev::Invitation::Status }

      # @!attribute updated_at
      #
      #   @return [Time]
      required :updated_at, Time, api_name: :updatedAt

      # @!attribute url
      #   Full URL to share with the client.
      #
      #   @return [String]
      required :url, String

      # @!attribute client_email
      #
      #   @return [String, nil]
      optional :client_email, String, api_name: :clientEmail, nil?: true

      # @!attribute client_name
      #
      #   @return [String, nil]
      optional :client_name, String, api_name: :clientName, nil?: true

      # @!attribute client_phone
      #
      #   @return [String, nil]
      optional :client_phone, String, api_name: :clientPhone, nil?: true

      # @!attribute completed_at
      #
      #   @return [Time, nil]
      optional :completed_at, Time, api_name: :completedAt, nil?: true

      # @!attribute phone_number_id
      #   ID of a pre-assigned Zavu phone number for WhatsApp registration.
      #
      #   @return [String, nil]
      optional :phone_number_id, String, api_name: :phoneNumberId, nil?: true

      # @!attribute sender_id
      #   ID of the sender created when invitation is completed.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId, nil?: true

      # @!attribute started_at
      #
      #   @return [Time, nil]
      optional :started_at, Time, api_name: :startedAt, nil?: true

      # @!attribute viewed_at
      #
      #   @return [Time, nil]
      optional :viewed_at, Time, api_name: :viewedAt, nil?: true

      # @!method initialize(id:, token:, created_at:, expires_at:, status:, updated_at:, url:, client_email: nil, client_name: nil, client_phone: nil, completed_at: nil, phone_number_id: nil, sender_id: nil, started_at: nil, viewed_at: nil)
      #   @param id [String]
      #
      #   @param token [String] Unique invitation token.
      #
      #   @param created_at [Time]
      #
      #   @param expires_at [Time]
      #
      #   @param status [Symbol, Zavudev::Models::Invitation::Status] Current status of the partner invitation.
      #
      #   @param updated_at [Time]
      #
      #   @param url [String] Full URL to share with the client.
      #
      #   @param client_email [String, nil]
      #
      #   @param client_name [String, nil]
      #
      #   @param client_phone [String, nil]
      #
      #   @param completed_at [Time, nil]
      #
      #   @param phone_number_id [String, nil] ID of a pre-assigned Zavu phone number for WhatsApp registration.
      #
      #   @param sender_id [String, nil] ID of the sender created when invitation is completed.
      #
      #   @param started_at [Time, nil]
      #
      #   @param viewed_at [Time, nil]

      # Current status of the partner invitation.
      #
      # @see Zavudev::Models::Invitation#status
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        IN_PROGRESS = :in_progress
        COMPLETED = :completed
        EXPIRED = :expired
        CANCELLED = :cancelled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
