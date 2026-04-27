# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class WhatsappSync
        # Get the current sync status for a sender's WhatsApp coexistence account. Only
        # available for senders connected in coexistence mode (WhatsApp Business App +
        # Cloud API).
        #
        # @overload retrieve(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::WhatsappSyncRetrieveResponse]
        #
        # @see Zavudev::Models::Senders::WhatsappSyncRetrieveParams
        def retrieve(sender_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/senders/%1$s/whatsapp-sync", sender_id],
            model: Zavudev::Models::Senders::WhatsappSyncRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Initiate contact names sync from the WhatsApp Business App. This imports contact
        # names stored in the app to Zavu. Only available for coexistence accounts with
        # active status.
        #
        # @overload start_contacts_sync(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::WhatsappSyncStartContactsSyncResponse]
        #
        # @see Zavudev::Models::Senders::WhatsappSyncStartContactsSyncParams
        def start_contacts_sync(sender_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/senders/%1$s/whatsapp-sync/contacts", sender_id],
            model: Zavudev::Models::Senders::WhatsappSyncStartContactsSyncResponse,
            options: params[:request_options]
          )
        end

        # Initiate message history sync from the WhatsApp Business App. This sends a
        # request to the account owner to approve sharing their conversation history. Only
        # available for coexistence accounts with active status.
        #
        # @overload start_history_sync(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::WhatsappSyncStartHistorySyncResponse]
        #
        # @see Zavudev::Models::Senders::WhatsappSyncStartHistorySyncParams
        def start_history_sync(sender_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/senders/%1$s/whatsapp-sync/history", sender_id],
            model: Zavudev::Models::Senders::WhatsappSyncStartHistorySyncResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Zavudev::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
