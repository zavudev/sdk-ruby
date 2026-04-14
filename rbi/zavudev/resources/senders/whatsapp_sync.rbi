# typed: strong

module Zavudev
  module Resources
    class Senders
      class WhatsappSync
        # Get the current sync status for a sender's WhatsApp coexistence account. Only
        # available for senders connected in coexistence mode (WhatsApp Business App +
        # Cloud API).
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Senders::WhatsappSyncRetrieveResponse)
        end
        def retrieve(sender_id, request_options: {})
        end

        # Initiate contact names sync from the WhatsApp Business App. This imports contact
        # names stored in the app to Zavu. Only available for coexistence accounts with
        # active status.
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(
            Zavudev::Models::Senders::WhatsappSyncStartContactsSyncResponse
          )
        end
        def start_contacts_sync(sender_id, request_options: {})
        end

        # Initiate message history sync from the WhatsApp Business App. This sends a
        # request to the account owner to approve sharing their conversation history. Only
        # available for coexistence accounts with active status.
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(
            Zavudev::Models::Senders::WhatsappSyncStartHistorySyncResponse
          )
        end
        def start_history_sync(sender_id, request_options: {})
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
