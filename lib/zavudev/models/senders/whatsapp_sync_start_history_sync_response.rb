# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::WhatsappSync#start_history_sync
      class WhatsappSyncStartHistorySyncResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute message
        #   Success message.
        #
        #   @return [String]
        required :message, String

        # @!attribute sync
        #   WhatsApp coexistence sync status.
        #
        #   @return [Zavudev::Models::Senders::WhatsAppSyncStatus]
        required :sync, -> { Zavudev::Senders::WhatsAppSyncStatus }

        # @!method initialize(message:, sync:)
        #   @param message [String] Success message.
        #
        #   @param sync [Zavudev::Models::Senders::WhatsAppSyncStatus] WhatsApp coexistence sync status.
      end
    end
  end
end
