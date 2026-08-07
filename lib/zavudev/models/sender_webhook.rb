# frozen_string_literal: true

module Zavudev
  module Models
    class SenderWebhook < Zavudev::Internal::Type::BaseModel
      # @!attribute active
      #   Whether the webhook is active.
      #
      #   @return [Boolean]
      required :active, Zavudev::Internal::Type::Boolean

      # @!attribute events
      #   List of events the webhook is subscribed to.
      #
      #   @return [Array<Symbol, Zavudev::Models::WebhookEvent>]
      required :events, -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::WebhookEvent] }

      # @!attribute signature_version
      #   Which `X-Zavu-Signature` scheme this receiver is sent.
      #
      #   - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
      #     configurable. Existing webhooks stay on it until you move them.
      #   - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
      #     default for new senders. It signs the timestamp together with the body.
      #   - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
      #     reading either one works, so you can deploy and confirm your new verifier
      #     before switching over.
      #
      #   Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
      #   https://docs.zavu.dev/guides/receiving-messages/signature-migration
      #
      #   @return [Symbol, Zavudev::Models::SenderWebhook::SignatureVersion]
      required :signature_version,
               enum: -> { Zavudev::SenderWebhook::SignatureVersion },
               api_name: :signatureVersion

      # @!attribute url
      #   HTTPS URL that will receive webhook events.
      #
      #   @return [String]
      required :url, String

      # @!attribute secret
      #   Webhook secret for signature verification. Only returned on create or
      #   regenerate.
      #
      #   @return [String, nil]
      optional :secret, String

      # @!method initialize(active:, events:, signature_version:, url:, secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::SenderWebhook} for more details.
      #
      #   Webhook configuration for the sender.
      #
      #   @param active [Boolean] Whether the webhook is active.
      #
      #   @param events [Array<Symbol, Zavudev::Models::WebhookEvent>] List of events the webhook is subscribed to.
      #
      #   @param signature_version [Symbol, Zavudev::Models::SenderWebhook::SignatureVersion] Which `X-Zavu-Signature` scheme this receiver is sent.
      #
      #   @param url [String] HTTPS URL that will receive webhook events.
      #
      #   @param secret [String] Webhook secret for signature verification. Only returned on create or regenerate

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
      #
      # @see Zavudev::Models::SenderWebhook#signature_version
      module SignatureVersion
        extend Zavudev::Internal::Type::Enum

        V1 = :v1
        V1_V2 = :"v1+v2"
        V2 = :v2

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
