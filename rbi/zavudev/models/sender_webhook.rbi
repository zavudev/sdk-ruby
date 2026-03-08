# typed: strong

module Zavudev
  module Models
    class SenderWebhook < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::SenderWebhook, Zavudev::Internal::AnyHash)
        end

      # Whether the webhook is active.
      sig { returns(T::Boolean) }
      attr_accessor :active

      # List of events the webhook is subscribed to.
      sig { returns(T::Array[Zavudev::WebhookEvent::TaggedSymbol]) }
      attr_accessor :events

      # HTTPS URL that will receive webhook events.
      sig { returns(String) }
      attr_accessor :url

      # Webhook secret for signature verification. Only returned on create or
      # regenerate.
      sig { returns(T.nilable(String)) }
      attr_reader :secret

      sig { params(secret: String).void }
      attr_writer :secret

      # Webhook configuration for the sender.
      sig do
        params(
          active: T::Boolean,
          events: T::Array[Zavudev::WebhookEvent::OrSymbol],
          url: String,
          secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the webhook is active.
        active:,
        # List of events the webhook is subscribed to.
        events:,
        # HTTPS URL that will receive webhook events.
        url:,
        # Webhook secret for signature verification. Only returned on create or
        # regenerate.
        secret: nil
      )
      end

      sig do
        override.returns(
          {
            active: T::Boolean,
            events: T::Array[Zavudev::WebhookEvent::TaggedSymbol],
            url: String,
            secret: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
