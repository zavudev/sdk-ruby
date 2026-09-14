# typed: strong

module Zavudev
  module Models
    class Message < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Message, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      # Delivery channel. Use 'auto' for intelligent routing.
      sig { returns(Zavudev::Channel::TaggedSymbol) }
      attr_accessor :channel

      sig { returns(Time) }
      attr_accessor :created_at

      # Who sent the message. Needed to render a thread: `status` cannot tell the two
      # apart, because an inbound message is also stored as `delivered`.
      sig { returns(Zavudev::Message::Direction::TaggedSymbol) }
      attr_accessor :direction

      # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
      # by type).
      #
      # `location_request` asks the recipient to share their location and is
      # WhatsApp-only. It takes no `content` object — the prompt goes in `text` (max
      # 1024 characters) and the button label is fixed by WhatsApp. The recipient's
      # answer arrives as an inbound `location` message whose `content.replyToMessageId`
      # is the ID of the request.
      #
      # `request_contact_info` asks the recipient to share their phone number and is
      # WhatsApp-only. Like `location_request` it takes no `content` object — the prompt
      # goes in `text` (max 1024 characters) and WhatsApp renders a fixed **Share
      # Contact Info** button. The answer arrives as an inbound `contact` message. Use
      # it to recover the phone number of a contact who adopted a WhatsApp username and
      # is only known by their business-scoped user ID (BSUID); when they share it, Zavu
      # automatically links the phone number to that contact.
      sig { returns(Zavudev::MessageType::TaggedSymbol) }
      attr_accessor :message_type

      sig { returns(Zavudev::MessageStatus::TaggedSymbol) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :to

      # Content for non-text message types (WhatsApp and Telegram).
      sig { returns(T.nilable(Zavudev::MessageContent)) }
      attr_reader :content

      sig { params(content: Zavudev::MessageContent::OrHash).void }
      attr_writer :content

      # ID of the conversation (inbox thread) this message belongs to. Use it to build a
      # direct dashboard link:
      # `https://dashboard.zavu.dev/{locale}/inbox?conv={conversationId}`. Omitted only
      # on legacy messages created before conversation threading.
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      # Zavu platform charge in USD for this message. Messaging is billed against your
      # plan's monthly limits plus usage-based overage.
      sig { returns(T.nilable(Float)) }
      attr_accessor :cost

      # Carrier and delivery cost in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :cost_provider

      # Total cost in USD (platform charge + delivery cost).
      sig { returns(T.nilable(Float)) }
      attr_accessor :cost_total

      sig { returns(T.nilable(String)) }
      attr_accessor :error_code

      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Message ID from the delivery provider.
      sig { returns(T.nilable(String)) }
      attr_reader :provider_message_id

      sig { params(provider_message_id: String).void }
      attr_writer :provider_message_id

      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      # Text content or caption.
      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          id: String,
          channel: Zavudev::Channel::OrSymbol,
          created_at: Time,
          direction: Zavudev::Message::Direction::OrSymbol,
          message_type: Zavudev::MessageType::OrSymbol,
          status: Zavudev::MessageStatus::OrSymbol,
          to: String,
          content: Zavudev::MessageContent::OrHash,
          conversation_id: String,
          cost: T.nilable(Float),
          cost_provider: T.nilable(Float),
          cost_total: T.nilable(Float),
          error_code: T.nilable(String),
          error_message: T.nilable(String),
          from: String,
          metadata: T::Hash[Symbol, String],
          provider_message_id: String,
          sender_id: String,
          text: String,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Delivery channel. Use 'auto' for intelligent routing.
        channel:,
        created_at:,
        # Who sent the message. Needed to render a thread: `status` cannot tell the two
        # apart, because an inbound message is also stored as `delivered`.
        direction:,
        # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
        # by type).
        #
        # `location_request` asks the recipient to share their location and is
        # WhatsApp-only. It takes no `content` object — the prompt goes in `text` (max
        # 1024 characters) and the button label is fixed by WhatsApp. The recipient's
        # answer arrives as an inbound `location` message whose `content.replyToMessageId`
        # is the ID of the request.
        #
        # `request_contact_info` asks the recipient to share their phone number and is
        # WhatsApp-only. Like `location_request` it takes no `content` object — the prompt
        # goes in `text` (max 1024 characters) and WhatsApp renders a fixed **Share
        # Contact Info** button. The answer arrives as an inbound `contact` message. Use
        # it to recover the phone number of a contact who adopted a WhatsApp username and
        # is only known by their business-scoped user ID (BSUID); when they share it, Zavu
        # automatically links the phone number to that contact.
        message_type:,
        status:,
        to:,
        # Content for non-text message types (WhatsApp and Telegram).
        content: nil,
        # ID of the conversation (inbox thread) this message belongs to. Use it to build a
        # direct dashboard link:
        # `https://dashboard.zavu.dev/{locale}/inbox?conv={conversationId}`. Omitted only
        # on legacy messages created before conversation threading.
        conversation_id: nil,
        # Zavu platform charge in USD for this message. Messaging is billed against your
        # plan's monthly limits plus usage-based overage.
        cost: nil,
        # Carrier and delivery cost in USD.
        cost_provider: nil,
        # Total cost in USD (platform charge + delivery cost).
        cost_total: nil,
        error_code: nil,
        error_message: nil,
        from: nil,
        metadata: nil,
        # Message ID from the delivery provider.
        provider_message_id: nil,
        sender_id: nil,
        # Text content or caption.
        text: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channel: Zavudev::Channel::TaggedSymbol,
            created_at: Time,
            direction: Zavudev::Message::Direction::TaggedSymbol,
            message_type: Zavudev::MessageType::TaggedSymbol,
            status: Zavudev::MessageStatus::TaggedSymbol,
            to: String,
            content: Zavudev::MessageContent,
            conversation_id: String,
            cost: T.nilable(Float),
            cost_provider: T.nilable(Float),
            cost_total: T.nilable(Float),
            error_code: T.nilable(String),
            error_message: T.nilable(String),
            from: String,
            metadata: T::Hash[Symbol, String],
            provider_message_id: String,
            sender_id: String,
            text: String,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # Who sent the message. Needed to render a thread: `status` cannot tell the two
      # apart, because an inbound message is also stored as `delivered`.
      module Direction
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::Message::Direction) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND = T.let(:inbound, Zavudev::Message::Direction::TaggedSymbol)
        OUTBOUND = T.let(:outbound, Zavudev::Message::Direction::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::Message::Direction::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
