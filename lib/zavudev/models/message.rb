# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#list
    class Message < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute channel
      #   Delivery channel. Use 'auto' for intelligent routing.
      #
      #   @return [Symbol, Zavudev::Models::Channel]
      required :channel, enum: -> { Zavudev::Channel }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute message_type
      #   Type of message. Non-text types are supported by WhatsApp and Telegram (varies
      #   by type).
      #
      #   @return [Symbol, Zavudev::Models::MessageType]
      required :message_type, enum: -> { Zavudev::MessageType }, api_name: :messageType

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::MessageStatus]
      required :status, enum: -> { Zavudev::MessageStatus }

      # @!attribute to
      #
      #   @return [String]
      required :to, String

      # @!attribute content
      #   Content for non-text message types (WhatsApp and Telegram).
      #
      #   @return [Zavudev::Models::MessageContent, nil]
      optional :content, -> { Zavudev::MessageContent }

      # @!attribute cost
      #   MAU cost in USD (charged for first contact of the month).
      #
      #   @return [Float, nil]
      optional :cost, Float, nil?: true

      # @!attribute cost_provider
      #   Provider cost in USD (Telnyx, SES, etc.).
      #
      #   @return [Float, nil]
      optional :cost_provider, Float, api_name: :costProvider, nil?: true

      # @!attribute cost_total
      #   Total cost in USD (MAU + provider cost).
      #
      #   @return [Float, nil]
      optional :cost_total, Float, api_name: :costTotal, nil?: true

      # @!attribute error_code
      #
      #   @return [String, nil]
      optional :error_code, String, api_name: :errorCode, nil?: true

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, api_name: :errorMessage, nil?: true

      # @!attribute from
      #
      #   @return [String, nil]
      optional :from, String

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute provider_message_id
      #   Message ID from the delivery provider.
      #
      #   @return [String, nil]
      optional :provider_message_id, String, api_name: :providerMessageId

      # @!attribute sender_id
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId

      # @!attribute text
      #   Text content or caption.
      #
      #   @return [String, nil]
      optional :text, String

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, channel:, created_at:, message_type:, status:, to:, content: nil, cost: nil, cost_provider: nil, cost_total: nil, error_code: nil, error_message: nil, from: nil, metadata: nil, provider_message_id: nil, sender_id: nil, text: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see {Zavudev::Models::Message}
      #   for more details.
      #
      #   @param id [String]
      #
      #   @param channel [Symbol, Zavudev::Models::Channel] Delivery channel. Use 'auto' for intelligent routing.
      #
      #   @param created_at [Time]
      #
      #   @param message_type [Symbol, Zavudev::Models::MessageType] Type of message. Non-text types are supported by WhatsApp and Telegram (varies b
      #
      #   @param status [Symbol, Zavudev::Models::MessageStatus]
      #
      #   @param to [String]
      #
      #   @param content [Zavudev::Models::MessageContent] Content for non-text message types (WhatsApp and Telegram).
      #
      #   @param cost [Float, nil] MAU cost in USD (charged for first contact of the month).
      #
      #   @param cost_provider [Float, nil] Provider cost in USD (Telnyx, SES, etc.).
      #
      #   @param cost_total [Float, nil] Total cost in USD (MAU + provider cost).
      #
      #   @param error_code [String, nil]
      #
      #   @param error_message [String, nil]
      #
      #   @param from [String]
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param provider_message_id [String] Message ID from the delivery provider.
      #
      #   @param sender_id [String]
      #
      #   @param text [String] Text content or caption.
      #
      #   @param updated_at [Time]
    end
  end
end
