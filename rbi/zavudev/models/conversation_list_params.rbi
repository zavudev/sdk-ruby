# typed: strong

module Zavudev
  module Models
    class ConversationListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ConversationListParams, Zavudev::Internal::AnyHash)
        end

      # Keep only threads that have carried this channel.
      sig do
        returns(T.nilable(Zavudev::ConversationListParams::Channel::OrSymbol))
      end
      attr_reader :channel

      sig do
        params(channel: Zavudev::ConversationListParams::Channel::OrSymbol).void
      end
      attr_writer :channel

      # Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

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
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Keep only threads last handled by this sender.
      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      sig do
        params(
          channel: Zavudev::ConversationListParams::Channel::OrSymbol,
          cursor: String,
          limit: Integer,
          search: String,
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            channel: Zavudev::ConversationListParams::Channel::OrSymbol,
            cursor: String,
            limit: Integer,
            search: String,
            sender_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Keep only threads that have carried this channel.
      module Channel
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::ConversationListParams::Channel)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SMS =
          T.let(:sms, Zavudev::ConversationListParams::Channel::TaggedSymbol)
        SMS_ONEWAY =
          T.let(
            :sms_oneway,
            Zavudev::ConversationListParams::Channel::TaggedSymbol
          )
        WHATSAPP =
          T.let(
            :whatsapp,
            Zavudev::ConversationListParams::Channel::TaggedSymbol
          )
        EMAIL =
          T.let(:email, Zavudev::ConversationListParams::Channel::TaggedSymbol)
        TELEGRAM =
          T.let(
            :telegram,
            Zavudev::ConversationListParams::Channel::TaggedSymbol
          )
        INSTAGRAM =
          T.let(
            :instagram,
            Zavudev::ConversationListParams::Channel::TaggedSymbol
          )
        MESSENGER =
          T.let(
            :messenger,
            Zavudev::ConversationListParams::Channel::TaggedSymbol
          )
        VOICE =
          T.let(:voice, Zavudev::ConversationListParams::Channel::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::ConversationListParams::Channel::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
