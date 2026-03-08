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

      # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
      # by type).
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

      # MAU cost in USD (charged for first contact of the month).
      sig { returns(T.nilable(Float)) }
      attr_accessor :cost

      # Provider cost in USD (Telnyx, SES, etc.).
      sig { returns(T.nilable(Float)) }
      attr_accessor :cost_provider

      # Total cost in USD (MAU + provider cost).
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
          message_type: Zavudev::MessageType::OrSymbol,
          status: Zavudev::MessageStatus::OrSymbol,
          to: String,
          content: Zavudev::MessageContent::OrHash,
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
        # Type of message. Non-text types are supported by WhatsApp and Telegram (varies
        # by type).
        message_type:,
        status:,
        to:,
        # Content for non-text message types (WhatsApp and Telegram).
        content: nil,
        # MAU cost in USD (charged for first contact of the month).
        cost: nil,
        # Provider cost in USD (Telnyx, SES, etc.).
        cost_provider: nil,
        # Total cost in USD (MAU + provider cost).
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
            message_type: Zavudev::MessageType::TaggedSymbol,
            status: Zavudev::MessageStatus::TaggedSymbol,
            to: String,
            content: Zavudev::MessageContent,
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
    end
  end
end
