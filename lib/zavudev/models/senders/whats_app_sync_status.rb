# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      class WhatsAppSyncStatus < Zavudev::Internal::Type::BaseModel
        # @!attribute contacts
        #   Contacts sync status details.
        #
        #   @return [Zavudev::Models::Senders::WhatsAppSyncContacts]
        required :contacts, -> { Zavudev::Senders::WhatsAppSyncContacts }

        # @!attribute history
        #   History sync status details.
        #
        #   @return [Zavudev::Models::Senders::WhatsAppSyncHistory]
        required :history, -> { Zavudev::Senders::WhatsAppSyncHistory }

        # @!attribute is_coexistence
        #   Whether the account is in coexistence mode.
        #
        #   @return [Boolean]
        required :is_coexistence, Zavudev::Internal::Type::Boolean, api_name: :isCoexistence

        # @!attribute status
        #   WhatsApp account status.
        #
        #   @return [Symbol, Zavudev::Models::Senders::WhatsAppSyncStatus::Status]
        required :status, enum: -> { Zavudev::Senders::WhatsAppSyncStatus::Status }

        # @!method initialize(contacts:, history:, is_coexistence:, status:)
        #   WhatsApp coexistence sync status.
        #
        #   @param contacts [Zavudev::Models::Senders::WhatsAppSyncContacts] Contacts sync status details.
        #
        #   @param history [Zavudev::Models::Senders::WhatsAppSyncHistory] History sync status details.
        #
        #   @param is_coexistence [Boolean] Whether the account is in coexistence mode.
        #
        #   @param status [Symbol, Zavudev::Models::Senders::WhatsAppSyncStatus::Status] WhatsApp account status.

        # WhatsApp account status.
        #
        # @see Zavudev::Models::Senders::WhatsAppSyncStatus#status
        module Status
          extend Zavudev::Internal::Type::Enum

          PENDING_VERIFICATION = :pending_verification
          PENDING_REGISTRATION = :pending_registration
          ACTIVE = :active
          DISCONNECTED = :disconnected
          ERROR = :error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
