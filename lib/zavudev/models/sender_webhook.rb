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

      # @!method initialize(active:, events:, url:, secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::SenderWebhook} for more details.
      #
      #   Webhook configuration for the sender.
      #
      #   @param active [Boolean] Whether the webhook is active.
      #
      #   @param events [Array<Symbol, Zavudev::Models::WebhookEvent>] List of events the webhook is subscribed to.
      #
      #   @param url [String] HTTPS URL that will receive webhook events.
      #
      #   @param secret [String] Webhook secret for signature verification. Only returned on create or regenerate
    end
  end
end
