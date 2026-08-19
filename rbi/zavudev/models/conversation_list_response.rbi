# typed: strong

module Zavudev
  module Models
    class ConversationListResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::ConversationListResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Every channel this thread has carried messages on.
      sig { returns(T::Array[String]) }
      attr_accessor :channels

      # The key this thread is filed under: a phone number in E.164, a WhatsApp
      # business-scoped user ID (BSUID), a numeric chat ID
      # (Telegram/Instagram/Messenger), or a group JID. It is not always a phone number,
      # so do not parse it as one.
      sig { returns(String) }
      attr_accessor :contact_identifier

      sig { returns(Time) }
      attr_accessor :created_at

      # Denormalized preview of the most recent message, so a thread list needs no extra
      # fetch.
      sig { returns(Zavudev::Models::ConversationListResponse::LastMessage) }
      attr_reader :last_message

      sig do
        params(
          last_message:
            Zavudev::Models::ConversationListResponse::LastMessage::OrHash
        ).void
      end
      attr_writer :last_message

      sig { returns(Integer) }
      attr_accessor :message_count

      # Inbound messages not yet marked read. Reset with POST
      # /v1/conversations/{conversationId}/read.
      sig { returns(Integer) }
      attr_accessor :unread_count

      sig { returns(Time) }
      attr_accessor :updated_at

      # ID of the contact this thread belongs to. Absent on group threads and on threads
      # whose contact has not been resolved yet.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_id

      sig { params(contact_id: String).void }
      attr_writer :contact_id

      # Email address of the thread, when the contact was reached by email.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Present when the thread is a group chat rather than a one-to-one conversation.
      sig do
        returns(T.nilable(Zavudev::Models::ConversationListResponse::Group))
      end
      attr_reader :group

      sig do
        params(
          group: Zavudev::Models::ConversationListResponse::Group::OrHash
        ).void
      end
      attr_writer :group

      # Sender that last handled this thread. Use it as the `Zavu-Sender` header when
      # replying so the answer leaves from the same number the contact knows.
      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      # WhatsApp identity, present when the contact adopted a username.
      sig do
        returns(T.nilable(Zavudev::Models::ConversationListResponse::Whatsapp))
      end
      attr_reader :whatsapp

      sig do
        params(
          whatsapp: Zavudev::Models::ConversationListResponse::Whatsapp::OrHash
        ).void
      end
      attr_writer :whatsapp

      # An inbox thread with one contact. A conversation groups every message exchanged
      # with that contact across channels, so a contact who writes on WhatsApp and later
      # by email stays in one thread.
      sig do
        params(
          id: String,
          channels: T::Array[String],
          contact_identifier: String,
          created_at: Time,
          last_message:
            Zavudev::Models::ConversationListResponse::LastMessage::OrHash,
          message_count: Integer,
          unread_count: Integer,
          updated_at: Time,
          contact_id: String,
          email: String,
          group: Zavudev::Models::ConversationListResponse::Group::OrHash,
          sender_id: String,
          whatsapp: Zavudev::Models::ConversationListResponse::Whatsapp::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Every channel this thread has carried messages on.
        channels:,
        # The key this thread is filed under: a phone number in E.164, a WhatsApp
        # business-scoped user ID (BSUID), a numeric chat ID
        # (Telegram/Instagram/Messenger), or a group JID. It is not always a phone number,
        # so do not parse it as one.
        contact_identifier:,
        created_at:,
        # Denormalized preview of the most recent message, so a thread list needs no extra
        # fetch.
        last_message:,
        message_count:,
        # Inbound messages not yet marked read. Reset with POST
        # /v1/conversations/{conversationId}/read.
        unread_count:,
        updated_at:,
        # ID of the contact this thread belongs to. Absent on group threads and on threads
        # whose contact has not been resolved yet.
        contact_id: nil,
        # Email address of the thread, when the contact was reached by email.
        email: nil,
        # Present when the thread is a group chat rather than a one-to-one conversation.
        group: nil,
        # Sender that last handled this thread. Use it as the `Zavu-Sender` header when
        # replying so the answer leaves from the same number the contact knows.
        sender_id: nil,
        # WhatsApp identity, present when the contact adopted a username.
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channels: T::Array[String],
            contact_identifier: String,
            created_at: Time,
            last_message:
              Zavudev::Models::ConversationListResponse::LastMessage,
            message_count: Integer,
            unread_count: Integer,
            updated_at: Time,
            contact_id: String,
            email: String,
            group: Zavudev::Models::ConversationListResponse::Group,
            sender_id: String,
            whatsapp: Zavudev::Models::ConversationListResponse::Whatsapp
          }
        )
      end
      def to_hash
      end

      class LastMessage < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::ConversationListResponse::LastMessage,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :at

        # Delivery channel. Use 'auto' for intelligent routing.
        sig { returns(Zavudev::Channel::TaggedSymbol) }
        attr_accessor :channel

        sig do
          returns(
            Zavudev::Models::ConversationListResponse::LastMessage::Direction::TaggedSymbol
          )
        end
        attr_accessor :direction

        # Text or caption. Empty when the last message carried no text (e.g. media).
        sig { returns(String) }
        attr_accessor :text

        # Denormalized preview of the most recent message, so a thread list needs no extra
        # fetch.
        sig do
          params(
            id: String,
            at: Time,
            channel: Zavudev::Channel::OrSymbol,
            direction:
              Zavudev::Models::ConversationListResponse::LastMessage::Direction::OrSymbol,
            text: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          at:,
          # Delivery channel. Use 'auto' for intelligent routing.
          channel:,
          direction:,
          # Text or caption. Empty when the last message carried no text (e.g. media).
          text:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              at: Time,
              channel: Zavudev::Channel::TaggedSymbol,
              direction:
                Zavudev::Models::ConversationListResponse::LastMessage::Direction::TaggedSymbol,
              text: String
            }
          )
        end
        def to_hash
        end

        module Direction
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::ConversationListResponse::LastMessage::Direction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INBOUND =
            T.let(
              :inbound,
              Zavudev::Models::ConversationListResponse::LastMessage::Direction::TaggedSymbol
            )
          OUTBOUND =
            T.let(
              :outbound,
              Zavudev::Models::ConversationListResponse::LastMessage::Direction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::ConversationListResponse::LastMessage::Direction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Group < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::ConversationListResponse::Group,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(Integer)) }
        attr_reader :participant_count

        sig { params(participant_count: Integer).void }
        attr_writer :participant_count

        sig { returns(T.nilable(String)) }
        attr_reader :subject

        sig { params(subject: String).void }
        attr_writer :subject

        # Present when the thread is a group chat rather than a one-to-one conversation.
        sig do
          params(
            id: String,
            participant_count: Integer,
            subject: String
          ).returns(T.attached_class)
        end
        def self.new(id:, participant_count: nil, subject: nil)
        end

        sig do
          override.returns(
            { id: String, participant_count: Integer, subject: String }
          )
        end
        def to_hash
        end
      end

      class Whatsapp < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::ConversationListResponse::Whatsapp,
              Zavudev::Internal::AnyHash
            )
          end

        # Business-scoped user ID. Can be used as `to` when sending.
        sig { returns(T.nilable(String)) }
        attr_reader :bsuid

        sig { params(bsuid: String).void }
        attr_writer :bsuid

        sig { returns(T.nilable(String)) }
        attr_reader :username

        sig { params(username: String).void }
        attr_writer :username

        # WhatsApp identity, present when the contact adopted a username.
        sig do
          params(bsuid: String, username: String).returns(T.attached_class)
        end
        def self.new(
          # Business-scoped user ID. Can be used as `to` when sending.
          bsuid: nil,
          username: nil
        )
        end

        sig { override.returns({ bsuid: String, username: String }) }
        def to_hash
        end
      end
    end
  end
end
