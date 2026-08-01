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
      #   `location_request` asks the recipient to share their location and is
      #   WhatsApp-only. It takes no `content` object — the prompt goes in `text` (max
      #   1024 characters) and the button label is fixed by WhatsApp. The recipient's
      #   answer arrives as an inbound `location` message whose `content.replyToMessageId`
      #   is the ID of the request.
      #
      #   `request_contact_info` asks the recipient to share their phone number and is
      #   WhatsApp-only. Like `location_request` it takes no `content` object — the prompt
      #   goes in `text` (max 1024 characters) and WhatsApp renders a fixed **Share
      #   Contact Info** button. The answer arrives as an inbound `contact` message. Use
      #   it to recover the phone number of a contact who adopted a WhatsApp username and
      #   is only known by their business-scoped user ID (BSUID); when they share it, Zavu
      #   automatically links the phone number to that contact.
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

      # @!attribute conversation_id
      #   ID of the conversation (inbox thread) this message belongs to. Use it to build a
      #   direct dashboard link:
      #   `https://dashboard.zavu.dev/{locale}/inbox?conv={conversationId}`. Omitted only
      #   on legacy messages created before conversation threading.
      #
      #   @return [String, nil]
      optional :conversation_id, String, api_name: :conversationId

      # @!attribute cost
      #   Zavu platform charge in USD for this message. Messaging is billed against your
      #   plan's monthly limits plus usage-based overage.
      #
      #   @return [Float, nil]
      optional :cost, Float, nil?: true

      # @!attribute cost_provider
      #   Carrier and delivery cost in USD.
      #
      #   @return [Float, nil]
      optional :cost_provider, Float, api_name: :costProvider, nil?: true

      # @!attribute cost_total
      #   Total cost in USD (platform charge + delivery cost).
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

      # @!method initialize(id:, channel:, created_at:, message_type:, status:, to:, content: nil, conversation_id: nil, cost: nil, cost_provider: nil, cost_total: nil, error_code: nil, error_message: nil, from: nil, metadata: nil, provider_message_id: nil, sender_id: nil, text: nil, updated_at: nil)
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
      #   @param conversation_id [String] ID of the conversation (inbox thread) this message belongs to. Use it to build a
      #
      #   @param cost [Float, nil] Zavu platform charge in USD for this message. Messaging is billed against your p
      #
      #   @param cost_provider [Float, nil] Carrier and delivery cost in USD.
      #
      #   @param cost_total [Float, nil] Total cost in USD (platform charge + delivery cost).
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
