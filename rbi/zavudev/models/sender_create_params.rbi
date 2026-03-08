# typed: strong

module Zavudev
  module Models
    class SenderCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SenderCreateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :set_as_default

      sig { params(set_as_default: T::Boolean).void }
      attr_writer :set_as_default

      # Events to subscribe to.
      sig { returns(T.nilable(T::Array[Zavudev::WebhookEvent::OrSymbol])) }
      attr_reader :webhook_events

      sig do
        params(webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol]).void
      end
      attr_writer :webhook_events

      # HTTPS URL for webhook events.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_url

      sig { params(webhook_url: String).void }
      attr_writer :webhook_url

      sig do
        params(
          name: String,
          phone_number: String,
          set_as_default: T::Boolean,
          webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
          webhook_url: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        phone_number:,
        set_as_default: nil,
        # Events to subscribe to.
        webhook_events: nil,
        # HTTPS URL for webhook events.
        webhook_url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            phone_number: String,
            set_as_default: T::Boolean,
            webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
            webhook_url: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
