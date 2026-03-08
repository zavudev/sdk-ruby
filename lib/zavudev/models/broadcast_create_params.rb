# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#create
    class BroadcastCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute channel
      #   Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastChannel]
      required :channel, enum: -> { Zavudev::BroadcastChannel }

      # @!attribute name
      #   Name of the broadcast campaign.
      #
      #   @return [String]
      required :name, String

      # @!attribute content
      #   Content for non-text broadcast message types.
      #
      #   @return [Zavudev::Models::BroadcastContent, nil]
      optional :content, -> { Zavudev::BroadcastContent }

      # @!attribute email_html_body
      #   HTML body for email broadcasts.
      #
      #   @return [String, nil]
      optional :email_html_body, String, api_name: :emailHtmlBody

      # @!attribute email_subject
      #   Email subject line. Required for email broadcasts.
      #
      #   @return [String, nil]
      optional :email_subject, String, api_name: :emailSubject

      # @!attribute idempotency_key
      #   Idempotency key to prevent duplicate broadcasts.
      #
      #   @return [String, nil]
      optional :idempotency_key, String, api_name: :idempotencyKey

      # @!attribute message_type
      #   Type of message for broadcast.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastMessageType, nil]
      optional :message_type, enum: -> { Zavudev::BroadcastMessageType }, api_name: :messageType

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute scheduled_at
      #   Schedule the broadcast for future delivery.
      #
      #   @return [Time, nil]
      optional :scheduled_at, Time, api_name: :scheduledAt

      # @!attribute sender_id
      #   Sender profile ID. Uses default sender if omitted.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId

      # @!attribute text
      #   Text content or caption. Supports template variables: {{name}}, {{1}}, etc.
      #
      #   @return [String, nil]
      optional :text, String

      # @!method initialize(channel:, name:, content: nil, email_html_body: nil, email_subject: nil, idempotency_key: nil, message_type: nil, metadata: nil, scheduled_at: nil, sender_id: nil, text: nil, request_options: {})
      #   @param channel [Symbol, Zavudev::Models::BroadcastChannel] Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      #
      #   @param name [String] Name of the broadcast campaign.
      #
      #   @param content [Zavudev::Models::BroadcastContent] Content for non-text broadcast message types.
      #
      #   @param email_html_body [String] HTML body for email broadcasts.
      #
      #   @param email_subject [String] Email subject line. Required for email broadcasts.
      #
      #   @param idempotency_key [String] Idempotency key to prevent duplicate broadcasts.
      #
      #   @param message_type [Symbol, Zavudev::Models::BroadcastMessageType] Type of message for broadcast.
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param scheduled_at [Time] Schedule the broadcast for future delivery.
      #
      #   @param sender_id [String] Sender profile ID. Uses default sender if omitted.
      #
      #   @param text [String] Text content or caption. Supports template variables: {{name}}, {{1}}, etc.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
