# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      class WhatsAppSyncHistory < Zavudev::Internal::Type::BaseModel
        # @!attribute can_sync
        #   Whether history sync can be initiated.
        #
        #   @return [Boolean]
        required :can_sync, Zavudev::Internal::Type::Boolean, api_name: :canSync

        # @!attribute status
        #   Status of WhatsApp message history sync.
        #
        #   @return [Symbol, Zavudev::Models::Senders::WhatsAppSyncHistory::Status]
        required :status, enum: -> { Zavudev::Senders::WhatsAppSyncHistory::Status }

        # @!attribute completed_at
        #   When the sync was completed.
        #
        #   @return [Time, nil]
        optional :completed_at, Time, api_name: :completedAt, nil?: true

        # @!attribute requested_at
        #   When the sync was last requested.
        #
        #   @return [Time, nil]
        optional :requested_at, Time, api_name: :requestedAt, nil?: true

        # @!method initialize(can_sync:, status:, completed_at: nil, requested_at: nil)
        #   History sync status details.
        #
        #   @param can_sync [Boolean] Whether history sync can be initiated.
        #
        #   @param status [Symbol, Zavudev::Models::Senders::WhatsAppSyncHistory::Status] Status of WhatsApp message history sync.
        #
        #   @param completed_at [Time, nil] When the sync was completed.
        #
        #   @param requested_at [Time, nil] When the sync was last requested.

        # Status of WhatsApp message history sync.
        #
        # @see Zavudev::Models::Senders::WhatsAppSyncHistory#status
        module Status
          extend Zavudev::Internal::Type::Enum

          NOT_REQUESTED = :not_requested
          PENDING = :pending
          SYNCING = :syncing
          COMPLETED = :completed
          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
