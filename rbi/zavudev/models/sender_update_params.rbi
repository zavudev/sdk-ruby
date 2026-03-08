# typed: strong

module Zavudev
  module Models
    class SenderUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SenderUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :sender_id

      # Enable or disable inbound email receiving for this sender.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :email_receiving_enabled

      sig { params(email_receiving_enabled: T::Boolean).void }
      attr_writer :email_receiving_enabled

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :set_as_default

      sig { params(set_as_default: T::Boolean).void }
      attr_writer :set_as_default

      # Whether the webhook is active.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :webhook_active

      sig { params(webhook_active: T::Boolean).void }
      attr_writer :webhook_active

      # Events to subscribe to.
      sig { returns(T.nilable(T::Array[Zavudev::WebhookEvent::OrSymbol])) }
      attr_reader :webhook_events

      sig do
        params(webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol]).void
      end
      attr_writer :webhook_events

      # HTTPS URL for webhook events. Set to null to remove webhook.
      sig { returns(T.nilable(String)) }
      attr_accessor :webhook_url

      sig do
        params(
          sender_id: String,
          email_receiving_enabled: T::Boolean,
          name: String,
          set_as_default: T::Boolean,
          webhook_active: T::Boolean,
          webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
          webhook_url: T.nilable(String),
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        sender_id:,
        # Enable or disable inbound email receiving for this sender.
        email_receiving_enabled: nil,
        name: nil,
        set_as_default: nil,
        # Whether the webhook is active.
        webhook_active: nil,
        # Events to subscribe to.
        webhook_events: nil,
        # HTTPS URL for webhook events. Set to null to remove webhook.
        webhook_url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            sender_id: String,
            email_receiving_enabled: T::Boolean,
            name: String,
            set_as_default: T::Boolean,
            webhook_active: T::Boolean,
            webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
            webhook_url: T.nilable(String),
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
