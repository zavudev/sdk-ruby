# frozen_string_literal: true

module Zavudev
  module Resources
    class Broadcasts
      class Contacts
        # List contacts in a broadcast with optional status filter.
        #
        # @overload list(broadcast_id, cursor: nil, limit: nil, status: nil, request_options: {})
        #
        # @param broadcast_id [String]
        #
        # @param cursor [String]
        #
        # @param limit [Integer]
        #
        # @param status [Symbol, Zavudev::Models::BroadcastContactStatus] Status of a contact within a broadcast.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Internal::Cursor<Zavudev::Models::BroadcastContact>]
        #
        # @see Zavudev::Models::Broadcasts::ContactListParams
        def list(broadcast_id, params = {})
          parsed, options = Zavudev::Broadcasts::ContactListParams.dump_request(params)
          query = Zavudev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["v1/broadcasts/%1$s/contacts", broadcast_id],
            query: query,
            page: Zavudev::Internal::Cursor,
            model: Zavudev::BroadcastContact,
            options: options
          )
        end

        # Add contacts to a broadcast in batch. Maximum 1000 contacts per request.
        #
        # @overload add(broadcast_id, contacts:, request_options: {})
        #
        # @param broadcast_id [String]
        #
        # @param contacts [Array<Zavudev::Models::Broadcasts::ContactAddParams::Contact>] List of contacts to add (max 1000 per request).
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Broadcasts::ContactAddResponse]
        #
        # @see Zavudev::Models::Broadcasts::ContactAddParams
        def add(broadcast_id, params)
          parsed, options = Zavudev::Broadcasts::ContactAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/broadcasts/%1$s/contacts", broadcast_id],
            body: parsed,
            model: Zavudev::Models::Broadcasts::ContactAddResponse,
            options: options
          )
        end

        # Remove a contact from a broadcast in draft status.
        #
        # @overload remove(contact_id, broadcast_id:, request_options: {})
        #
        # @param contact_id [String] Broadcast contact ID (not the global contact ID)
        #
        # @param broadcast_id [String]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Broadcasts::ContactRemoveParams
        def remove(contact_id, params)
          parsed, options = Zavudev::Broadcasts::ContactRemoveParams.dump_request(params)
          broadcast_id =
            parsed.delete(:broadcast_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/broadcasts/%1$s/contacts/%2$s", broadcast_id, contact_id],
            model: NilClass,
            options: options
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
