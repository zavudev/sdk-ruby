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

      # Which `X-Zavu-Signature` scheme this receiver is sent.
      #
      # - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
      #   configurable. Existing webhooks stay on it until you move them.
      # - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
      #   default for new senders. It signs the timestamp together with the body.
      # - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
      #   reading either one works, so you can deploy and confirm your new verifier
      #   before switching over.
      #
      # Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
      # https://docs.zavu.dev/guides/receiving-messages/signature-migration
      sig { returns(Zavudev::SenderWebhook::SignatureVersion::TaggedSymbol) }
      attr_accessor :signature_version

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
          signature_version: Zavudev::SenderWebhook::SignatureVersion::OrSymbol,
          url: String,
          secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the webhook is active.
        active:,
        # List of events the webhook is subscribed to.
        events:,
        # Which `X-Zavu-Signature` scheme this receiver is sent.
        #
        # - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
        #   configurable. Existing webhooks stay on it until you move them.
        # - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
        #   default for new senders. It signs the timestamp together with the body.
        # - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
        #   reading either one works, so you can deploy and confirm your new verifier
        #   before switching over.
        #
        # Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
        # https://docs.zavu.dev/guides/receiving-messages/signature-migration
        signature_version:,
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
            signature_version:
              Zavudev::SenderWebhook::SignatureVersion::TaggedSymbol,
            url: String,
            secret: String
          }
        )
      end
      def to_hash
      end

      # Which `X-Zavu-Signature` scheme this receiver is sent.
      #
      # - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
      #   configurable. Existing webhooks stay on it until you move them.
      # - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
      #   default for new senders. It signs the timestamp together with the body.
      # - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
      #   reading either one works, so you can deploy and confirm your new verifier
      #   before switching over.
      #
      # Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
      # https://docs.zavu.dev/guides/receiving-messages/signature-migration
      module SignatureVersion
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::SenderWebhook::SignatureVersion)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        V1 = T.let(:v1, Zavudev::SenderWebhook::SignatureVersion::TaggedSymbol)
        V1_V2 =
          T.let(
            :"v1+v2",
            Zavudev::SenderWebhook::SignatureVersion::TaggedSymbol
          )
        V2 = T.let(:v2, Zavudev::SenderWebhook::SignatureVersion::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::SenderWebhook::SignatureVersion::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
