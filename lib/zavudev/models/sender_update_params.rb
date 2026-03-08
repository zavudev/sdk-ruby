# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#update
    class SenderUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute sender_id
      #
      #   @return [String]
      required :sender_id, String

      # @!attribute email_receiving_enabled
      #   Enable or disable inbound email receiving for this sender.
      #
      #   @return [Boolean, nil]
      optional :email_receiving_enabled, Zavudev::Internal::Type::Boolean, api_name: :emailReceivingEnabled

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute set_as_default
      #
      #   @return [Boolean, nil]
      optional :set_as_default, Zavudev::Internal::Type::Boolean, api_name: :setAsDefault

      # @!attribute webhook_active
      #   Whether the webhook is active.
      #
      #   @return [Boolean, nil]
      optional :webhook_active, Zavudev::Internal::Type::Boolean, api_name: :webhookActive

      # @!attribute webhook_events
      #   Events to subscribe to.
      #
      #   @return [Array<Symbol, Zavudev::Models::WebhookEvent>, nil]
      optional :webhook_events,
               -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::WebhookEvent] },
               api_name: :webhookEvents

      # @!attribute webhook_url
      #   HTTPS URL for webhook events. Set to null to remove webhook.
      #
      #   @return [String, nil]
      optional :webhook_url, String, api_name: :webhookUrl, nil?: true

      # @!method initialize(sender_id:, email_receiving_enabled: nil, name: nil, set_as_default: nil, webhook_active: nil, webhook_events: nil, webhook_url: nil, request_options: {})
      #   @param sender_id [String]
      #
      #   @param email_receiving_enabled [Boolean] Enable or disable inbound email receiving for this sender.
      #
      #   @param name [String]
      #
      #   @param set_as_default [Boolean]
      #
      #   @param webhook_active [Boolean] Whether the webhook is active.
      #
      #   @param webhook_events [Array<Symbol, Zavudev::Models::WebhookEvent>] Events to subscribe to.
      #
      #   @param webhook_url [String, nil] HTTPS URL for webhook events. Set to null to remove webhook.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
