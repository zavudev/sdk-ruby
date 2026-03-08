# typed: strong

module Zavudev
  module Models
    class BroadcastCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastCreateParams, Zavudev::Internal::AnyHash)
        end

      # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      sig { returns(Zavudev::BroadcastChannel::OrSymbol) }
      attr_accessor :channel

      # Name of the broadcast campaign.
      sig { returns(String) }
      attr_accessor :name

      # Content for non-text broadcast message types.
      sig { returns(T.nilable(Zavudev::BroadcastContent)) }
      attr_reader :content

      sig { params(content: Zavudev::BroadcastContent::OrHash).void }
      attr_writer :content

      # HTML body for email broadcasts.
      sig { returns(T.nilable(String)) }
      attr_reader :email_html_body

      sig { params(email_html_body: String).void }
      attr_writer :email_html_body

      # Email subject line. Required for email broadcasts.
      sig { returns(T.nilable(String)) }
      attr_reader :email_subject

      sig { params(email_subject: String).void }
      attr_writer :email_subject

      # Idempotency key to prevent duplicate broadcasts.
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Type of message for broadcast.
      sig { returns(T.nilable(Zavudev::BroadcastMessageType::OrSymbol)) }
      attr_reader :message_type

      sig { params(message_type: Zavudev::BroadcastMessageType::OrSymbol).void }
      attr_writer :message_type

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Schedule the broadcast for future delivery.
      sig { returns(T.nilable(Time)) }
      attr_reader :scheduled_at

      sig { params(scheduled_at: Time).void }
      attr_writer :scheduled_at

      # Sender profile ID. Uses default sender if omitted.
      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      # Text content or caption. Supports template variables: {{name}}, {{1}}, etc.
      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig do
        params(
          channel: Zavudev::BroadcastChannel::OrSymbol,
          name: String,
          content: Zavudev::BroadcastContent::OrHash,
          email_html_body: String,
          email_subject: String,
          idempotency_key: String,
          message_type: Zavudev::BroadcastMessageType::OrSymbol,
          metadata: T::Hash[Symbol, String],
          scheduled_at: Time,
          sender_id: String,
          text: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
        channel:,
        # Name of the broadcast campaign.
        name:,
        # Content for non-text broadcast message types.
        content: nil,
        # HTML body for email broadcasts.
        email_html_body: nil,
        # Email subject line. Required for email broadcasts.
        email_subject: nil,
        # Idempotency key to prevent duplicate broadcasts.
        idempotency_key: nil,
        # Type of message for broadcast.
        message_type: nil,
        metadata: nil,
        # Schedule the broadcast for future delivery.
        scheduled_at: nil,
        # Sender profile ID. Uses default sender if omitted.
        sender_id: nil,
        # Text content or caption. Supports template variables: {{name}}, {{1}}, etc.
        text: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: Zavudev::BroadcastChannel::OrSymbol,
            name: String,
            content: Zavudev::BroadcastContent,
            email_html_body: String,
            email_subject: String,
            idempotency_key: String,
            message_type: Zavudev::BroadcastMessageType::OrSymbol,
            metadata: T::Hash[Symbol, String],
            scheduled_at: Time,
            sender_id: String,
            text: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
