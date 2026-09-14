# typed: strong

module Zavudev
  module Resources
    class Conversations
      # Get conversation
      sig do
        params(
          conversation_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::ConversationRetrieveResponse)
      end
      def retrieve(conversation_id, request_options: {})
      end

      # List inbox threads, most recently active first. A conversation groups every
      # message with one contact across channels, which is what you need to build an
      # inbox: `GET /v1/messages` returns a flat log with no thread to hang it on.
      #
      # Use `senderId` to scope the list to a single number, and `channel` to keep only
      # threads that have carried that channel.
      sig do
        params(
          channel: Zavudev::ConversationListParams::Channel::OrSymbol,
          cursor: String,
          limit: Integer,
          search: String,
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(
          Zavudev::Internal::Cursor[Zavudev::Models::ConversationListResponse]
        )
      end
      def list(
        # Keep only threads that have carried this channel.
        channel: nil,
        # Opaque cursor from a previous response's `nextCursor`. Do not construct it.
        cursor: nil,
        limit: nil,
        # Search threads by identity: phone number (any format — `+1 (555) 123-4567` and
        # `15551234567` both match), email address (full or local part), WhatsApp group
        # subject, WhatsApp username, or BSUID. Matching is by whole word, with prefix
        # matching on the last term, so `mar` finds `maria@example.com` and `+1555` finds
        # `+15551234567`; a fragment from the middle or end of a number (`4567`) does not
        # match.
        #
        # It does **not** search message bodies — only who the thread is with.
        #
        # Results come back ranked by relevance rather than by recency, so the usual "most
        # recently active first" ordering does not apply while `q` is set. `senderId` and
        # `channel` still narrow the results, and `cursor` paginates them as usual. An
        # empty or whitespace-only `q` returns no items rather than the full list.
        search: nil,
        # Keep only threads last handled by this sender.
        sender_id: nil,
        request_options: {}
      )
      end

      # Messages in this thread, newest first, across every channel it has carried.
      # Reply with `POST /v1/messages`, passing the conversation's `senderId` as the
      # `Zavu-Sender` header so the answer leaves from the number the contact already
      # knows.
      sig do
        params(
          conversation_id: String,
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Message])
      end
      def list_messages(
        conversation_id,
        # Opaque cursor from a previous response's `nextCursor`.
        cursor: nil,
        limit: nil,
        request_options: {}
      )
      end

      # Reset the thread's `unreadCount` to zero. Marks the thread read in your own
      # inbox only: it does not send a read receipt to the contact.
      sig do
        params(
          conversation_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::ConversationMarkAsReadResponse)
      end
      def mark_as_read(conversation_id, request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
