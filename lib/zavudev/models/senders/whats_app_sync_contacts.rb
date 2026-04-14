# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      class WhatsAppSyncContacts < Zavudev::Internal::Type::BaseModel
        # @!attribute can_sync
        #   Whether contacts sync can be initiated.
        #
        #   @return [Boolean]
        required :can_sync, Zavudev::Internal::Type::Boolean, api_name: :canSync

        # @!attribute status
        #   Status of WhatsApp contacts sync.
        #
        #   @return [Symbol, Zavudev::Models::Senders::WhatsAppSyncContacts::Status]
        required :status, enum: -> { Zavudev::Senders::WhatsAppSyncContacts::Status }

        # @!attribute requested_at
        #   When the sync was last requested.
        #
        #   @return [Time, nil]
        optional :requested_at, Time, api_name: :requestedAt, nil?: true

        # @!method initialize(can_sync:, status:, requested_at: nil)
        #   Contacts sync status details.
        #
        #   @param can_sync [Boolean] Whether contacts sync can be initiated.
        #
        #   @param status [Symbol, Zavudev::Models::Senders::WhatsAppSyncContacts::Status] Status of WhatsApp contacts sync.
        #
        #   @param requested_at [Time, nil] When the sync was last requested.

        # Status of WhatsApp contacts sync.
        #
        # @see Zavudev::Models::Senders::WhatsAppSyncContacts#status
        module Status
          extend Zavudev::Internal::Type::Enum

          NOT_REQUESTED = :not_requested
          PENDING = :pending
          SYNCING = :syncing
          COMPLETED = :completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
