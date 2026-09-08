# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Conversations#retrieve
    class ConversationRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute conversation
      #   An inbox thread with one contact. A conversation groups every message exchanged
      #   with that contact across channels, so a contact who writes on WhatsApp and later
      #   by email stays in one thread.
      #
      #   @return [Zavudev::Models::ConversationRetrieveResponse::Conversation]
      required :conversation, -> { Zavudev::Models::ConversationRetrieveResponse::Conversation }

      # @!method initialize(conversation:)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::ConversationRetrieveResponse} for more details.
      #
      #   @param conversation [Zavudev::Models::ConversationRetrieveResponse::Conversation] An inbox thread with one contact. A conversation groups every message exchanged

      # @see Zavudev::Models::ConversationRetrieveResponse#conversation
      class Conversation < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute channels
        #   Every channel this thread has carried messages on.
        #
        #   @return [Array<String>]
        required :channels, Zavudev::Internal::Type::ArrayOf[String]

        # @!attribute contact_identifier
        #   The key this thread is filed under: a phone number in E.164, a WhatsApp
        #   business-scoped user ID (BSUID), a numeric chat ID
        #   (Telegram/Instagram/Messenger), or a group JID. It is not always a phone number,
        #   so do not parse it as one.
        #
        #   @return [String]
        required :contact_identifier, String, api_name: :contactIdentifier

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute last_message
        #   Denormalized preview of the most recent message, so a thread list needs no extra
        #   fetch.
        #
        #   @return [Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage]
        required :last_message,
                 -> { Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage },
                 api_name: :lastMessage

        # @!attribute message_count
        #
        #   @return [Integer]
        required :message_count, Integer, api_name: :messageCount

        # @!attribute unread_count
        #   Inbound messages not yet marked read. Reset with POST
        #   /v1/conversations/{conversationId}/read.
        #
        #   @return [Integer]
        required :unread_count, Integer, api_name: :unreadCount

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute contact_id
        #   ID of the contact this thread belongs to. Absent on group threads and on threads
        #   whose contact has not been resolved yet.
        #
        #   @return [String, nil]
        optional :contact_id, String, api_name: :contactId

        # @!attribute email
        #   Email address of the thread, when the contact was reached by email.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute group
        #   Present when the thread is a group chat rather than a one-to-one conversation.
        #
        #   @return [Zavudev::Models::ConversationRetrieveResponse::Conversation::Group, nil]
        optional :group, -> { Zavudev::Models::ConversationRetrieveResponse::Conversation::Group }

        # @!attribute sender_id
        #   Sender that last handled this thread. Use it as the `Zavu-Sender` header when
        #   replying so the answer leaves from the same number the contact knows.
        #
        #   @return [String, nil]
        optional :sender_id, String, api_name: :senderId

        # @!attribute whatsapp
        #   WhatsApp identity, present when the contact adopted a username.
        #
        #   @return [Zavudev::Models::ConversationRetrieveResponse::Conversation::Whatsapp, nil]
        optional :whatsapp, -> { Zavudev::Models::ConversationRetrieveResponse::Conversation::Whatsapp }

        # @!method initialize(id:, channels:, contact_identifier:, created_at:, last_message:, message_count:, unread_count:, updated_at:, contact_id: nil, email: nil, group: nil, sender_id: nil, whatsapp: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::ConversationRetrieveResponse::Conversation} for more details.
        #
        #   An inbox thread with one contact. A conversation groups every message exchanged
        #   with that contact across channels, so a contact who writes on WhatsApp and later
        #   by email stays in one thread.
        #
        #   @param id [String]
        #
        #   @param channels [Array<String>] Every channel this thread has carried messages on.
        #
        #   @param contact_identifier [String] The key this thread is filed under: a phone number in E.164, a WhatsApp business
        #
        #   @param created_at [Time]
        #
        #   @param last_message [Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage] Denormalized preview of the most recent message, so a thread list needs no extra
        #
        #   @param message_count [Integer]
        #
        #   @param unread_count [Integer] Inbound messages not yet marked read. Reset with POST /v1/conversations/{convers
        #
        #   @param updated_at [Time]
        #
        #   @param contact_id [String] ID of the contact this thread belongs to. Absent on group threads and on threads
        #
        #   @param email [String] Email address of the thread, when the contact was reached by email.
        #
        #   @param group [Zavudev::Models::ConversationRetrieveResponse::Conversation::Group] Present when the thread is a group chat rather than a one-to-one conversation.
        #
        #   @param sender_id [String] Sender that last handled this thread. Use it as the `Zavu-Sender` header when re
        #
        #   @param whatsapp [Zavudev::Models::ConversationRetrieveResponse::Conversation::Whatsapp] WhatsApp identity, present when the contact adopted a username.

        # @see Zavudev::Models::ConversationRetrieveResponse::Conversation#last_message
        class LastMessage < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute at
          #
          #   @return [Time]
          required :at, Time

          # @!attribute channel
          #   Delivery channel. Use 'auto' for intelligent routing.
          #
          #   @return [Symbol, Zavudev::Models::Channel]
          required :channel, enum: -> { Zavudev::Channel }

          # @!attribute direction
          #
          #   @return [Symbol, Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage::Direction]
          required :direction,
                   enum: -> { Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage::Direction }

          # @!attribute text
          #   Text or caption. Empty when the last message carried no text (e.g. media).
          #
          #   @return [String]
          required :text, String

          # @!method initialize(id:, at:, channel:, direction:, text:)
          #   Denormalized preview of the most recent message, so a thread list needs no extra
          #   fetch.
          #
          #   @param id [String]
          #
          #   @param at [Time]
          #
          #   @param channel [Symbol, Zavudev::Models::Channel] Delivery channel. Use 'auto' for intelligent routing.
          #
          #   @param direction [Symbol, Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage::Direction]
          #
          #   @param text [String] Text or caption. Empty when the last message carried no text (e.g. media).

          # @see Zavudev::Models::ConversationRetrieveResponse::Conversation::LastMessage#direction
          module Direction
            extend Zavudev::Internal::Type::Enum

            INBOUND = :inbound
            OUTBOUND = :outbound

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Zavudev::Models::ConversationRetrieveResponse::Conversation#group
        class Group < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute participant_count
          #
          #   @return [Integer, nil]
          optional :participant_count, Integer, api_name: :participantCount

          # @!attribute subject
          #
          #   @return [String, nil]
          optional :subject, String

          # @!method initialize(id:, participant_count: nil, subject: nil)
          #   Present when the thread is a group chat rather than a one-to-one conversation.
          #
          #   @param id [String]
          #   @param participant_count [Integer]
          #   @param subject [String]
        end

        # @see Zavudev::Models::ConversationRetrieveResponse::Conversation#whatsapp
        class Whatsapp < Zavudev::Internal::Type::BaseModel
          # @!attribute bsuid
          #   Business-scoped user ID. Can be used as `to` when sending.
          #
          #   @return [String, nil]
          optional :bsuid, String

          # @!attribute username
          #
          #   @return [String, nil]
          optional :username, String

          # @!method initialize(bsuid: nil, username: nil)
          #   WhatsApp identity, present when the contact adopted a username.
          #
          #   @param bsuid [String] Business-scoped user ID. Can be used as `to` when sending.
          #
          #   @param username [String]
        end
      end
    end
  end
end
