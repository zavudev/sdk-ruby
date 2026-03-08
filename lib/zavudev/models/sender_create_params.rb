# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#create
    class SenderCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute set_as_default
      #
      #   @return [Boolean, nil]
      optional :set_as_default, Zavudev::Internal::Type::Boolean, api_name: :setAsDefault

      # @!attribute webhook_events
      #   Events to subscribe to.
      #
      #   @return [Array<Symbol, Zavudev::Models::WebhookEvent>, nil]
      optional :webhook_events,
               -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::WebhookEvent] },
               api_name: :webhookEvents

      # @!attribute webhook_url
      #   HTTPS URL for webhook events.
      #
      #   @return [String, nil]
      optional :webhook_url, String, api_name: :webhookUrl

      # @!method initialize(name:, phone_number:, set_as_default: nil, webhook_events: nil, webhook_url: nil, request_options: {})
      #   @param name [String]
      #
      #   @param phone_number [String]
      #
      #   @param set_as_default [Boolean]
      #
      #   @param webhook_events [Array<Symbol, Zavudev::Models::WebhookEvent>] Events to subscribe to.
      #
      #   @param webhook_url [String] HTTPS URL for webhook events.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
