# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::WhatsappSync#retrieve
      class WhatsappSyncRetrieveResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute sync
        #   WhatsApp coexistence sync status.
        #
        #   @return [Zavudev::Models::Senders::WhatsAppSyncStatus]
        required :sync, -> { Zavudev::Senders::WhatsAppSyncStatus }

        # @!method initialize(sync:)
        #   @param sync [Zavudev::Models::Senders::WhatsAppSyncStatus] WhatsApp coexistence sync status.
      end
    end
  end
end
