# frozen_string_literal: true

module Zavudev
  module Resources
    class Conversations
      # Get conversation
      #
      # @overload retrieve(conversation_id, request_options: {})
      #
      # @param conversation_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::ConversationRetrieveResponse]
      #
      # @see Zavudev::Models::ConversationRetrieveParams
      def retrieve(conversation_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/conversations/%1$s", conversation_id],
          model: Zavudev::Models::ConversationRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::ConversationListParams} for more details.
      #
      # List inbox threads, most recently active first. A conversation groups every
      # message with one contact across channels, which is what you need to build an
      # inbox: `GET /v1/messages` returns a flat log with no thread to hang it on.
      #
      # Use `senderId` to scope the list to a single number, and `channel` to keep only
      # threads that have carried that channel.
      #
      # @overload list(channel: nil, cursor: nil, limit: nil, search: nil, sender_id: nil, request_options: {})
      #
      # @param channel [Symbol, Zavudev::Models::ConversationListParams::Channel] Keep only threads that have carried this channel.
      #
      # @param cursor [String] Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      #
      # @param limit [Integer]
      #
      # @param search [String] Search threads by identity: phone number (any format — `+1 (555) 123-4567` and `
      #
      # @param sender_id [String] Keep only threads last handled by this sender.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::ConversationListResponse>]
      #
      # @see Zavudev::Models::ConversationListParams
      def list(params = {})
        parsed, options = Zavudev::ConversationListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/conversations",
          query: query.transform_keys(sender_id: "senderId"),
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Models::ConversationListResponse,
          options: options
        )
      end

      # Messages in this thread, newest first, across every channel it has carried.
      # Reply with `POST /v1/messages`, passing the conversation's `senderId` as the
      # `Zavu-Sender` header so the answer leaves from the number the contact already
      # knows.
      #
      # @overload list_messages(conversation_id, cursor: nil, limit: nil, request_options: {})
      #
      # @param conversation_id [String]
      #
      # @param cursor [String] Opaque cursor from a previous response's `nextCursor`.
      #
      # @param limit [Integer]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Message>]
      #
      # @see Zavudev::Models::ConversationListMessagesParams
      def list_messages(conversation_id, params = {})
        parsed, options = Zavudev::ConversationListMessagesParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/conversations/%1$s/messages", conversation_id],
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Message,
          options: options
        )
      end

      # Reset the thread's `unreadCount` to zero. Marks the thread read in your own
      # inbox only: it does not send a read receipt to the contact.
      #
      # @overload mark_as_read(conversation_id, request_options: {})
      #
      # @param conversation_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::ConversationMarkAsReadResponse]
      #
      # @see Zavudev::Models::ConversationMarkAsReadParams
      def mark_as_read(conversation_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/conversations/%1$s/read", conversation_id],
          model: Zavudev::Models::ConversationMarkAsReadResponse,
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
