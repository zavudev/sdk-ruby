# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Conversations#list
    class ConversationListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute channel
      #   Keep only threads that have carried this channel.
      #
      #   @return [Symbol, Zavudev::Models::ConversationListParams::Channel, nil]
      optional :channel, enum: -> { Zavudev::ConversationListParams::Channel }

      # @!attribute cursor
      #   Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute search
      #   Search threads by identity: phone number (any format — `+1 (555) 123-4567` and
      #   `15551234567` both match), email address (full or local part), WhatsApp group
      #   subject, WhatsApp username, or BSUID. Matching is by whole word, with prefix
      #   matching on the last term, so `mar` finds `maria@example.com` and `+1555` finds
      #   `+15551234567`; a fragment from the middle or end of a number (`4567`) does not
      #   match.
      #
      #   It does **not** search message bodies — only who the thread is with.
      #
      #   Results come back ranked by relevance rather than by recency, so the usual "most
      #   recently active first" ordering does not apply while `q` is set. `senderId` and
      #   `channel` still narrow the results, and `cursor` paginates them as usual. An
      #   empty or whitespace-only `q` returns no items rather than the full list.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute sender_id
      #   Keep only threads last handled by this sender.
      #
      #   @return [String, nil]
      optional :sender_id, String

      # @!method initialize(channel: nil, cursor: nil, limit: nil, search: nil, sender_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::ConversationListParams} for more details.
      #
      #   @param channel [Symbol, Zavudev::Models::ConversationListParams::Channel] Keep only threads that have carried this channel.
      #
      #   @param cursor [String] Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      #
      #   @param limit [Integer]
      #
      #   @param search [String] Search threads by identity: phone number (any format — `+1 (555) 123-4567` and `
      #
      #   @param sender_id [String] Keep only threads last handled by this sender.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Keep only threads that have carried this channel.
      module Channel
        extend Zavudev::Internal::Type::Enum

        SMS = :sms
        SMS_ONEWAY = :sms_oneway
        WHATSAPP = :whatsapp
        EMAIL = :email
        TELEGRAM = :telegram
        INSTAGRAM = :instagram
        MESSENGER = :messenger
        VOICE = :voice

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
