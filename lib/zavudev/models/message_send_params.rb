# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#send_
    class MessageSendParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute to
      #   Recipient phone number in E.164 format or email address.
      #
      #   @return [String]
      required :to, String

      # @!attribute channel
      #   Delivery channel. Use 'auto' for intelligent routing. If omitted with non-text
      #   messageType, WhatsApp is used. For email recipients, defaults to 'email'.
      #
      #   @return [Symbol, Zavudev::Models::Channel, nil]
      optional :channel, enum: -> { Zavudev::Channel }

      # @!attribute content
      #   Additional content for non-text message types.
      #
      #   @return [Zavudev::Models::MessageContent, nil]
      optional :content, -> { Zavudev::MessageContent }

      # @!attribute fallback_enabled
      #   Whether to enable automatic fallback to SMS if WhatsApp fails. Defaults to true.
      #
      #   @return [Boolean, nil]
      optional :fallback_enabled, Zavudev::Internal::Type::Boolean, api_name: :fallbackEnabled

      # @!attribute html_body
      #   HTML body for email messages. If provided, email will be sent as multipart with
      #   both text and HTML.
      #
      #   @return [String, nil]
      optional :html_body, String, api_name: :htmlBody

      # @!attribute idempotency_key
      #   Optional idempotency key to avoid duplicate sends.
      #
      #   @return [String, nil]
      optional :idempotency_key, String, api_name: :idempotencyKey

      # @!attribute message_type
      #   Type of message. Defaults to 'text'.
      #
      #   @return [Symbol, Zavudev::Models::MessageType, nil]
      optional :message_type, enum: -> { Zavudev::MessageType }, api_name: :messageType

      # @!attribute metadata
      #   Arbitrary metadata to associate with the message.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute reply_to
      #   Reply-To email address for email messages.
      #
      #   @return [String, nil]
      optional :reply_to, String, api_name: :replyTo

      # @!attribute subject
      #   Email subject line. Required when channel is 'email' or recipient is an email
      #   address.
      #
      #   @return [String, nil]
      optional :subject, String

      # @!attribute text
      #   Text body for text messages or caption for media messages.
      #
      #   @return [String, nil]
      optional :text, String

      # @!attribute voice_language
      #   Language code for voice text-to-speech (e.g., 'en-US', 'es-ES', 'pt-BR'). If
      #   omitted, language is auto-detected from recipient's country code.
      #
      #   @return [String, nil]
      optional :voice_language, String, api_name: :voiceLanguage

      # @!attribute zavu_sender
      #
      #   @return [String, nil]
      optional :zavu_sender, String

      # @!method initialize(to:, channel: nil, content: nil, fallback_enabled: nil, html_body: nil, idempotency_key: nil, message_type: nil, metadata: nil, reply_to: nil, subject: nil, text: nil, voice_language: nil, zavu_sender: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::MessageSendParams} for more details.
      #
      #   @param to [String] Recipient phone number in E.164 format or email address.
      #
      #   @param channel [Symbol, Zavudev::Models::Channel] Delivery channel. Use 'auto' for intelligent routing. If omitted with non-text m
      #
      #   @param content [Zavudev::Models::MessageContent] Additional content for non-text message types.
      #
      #   @param fallback_enabled [Boolean] Whether to enable automatic fallback to SMS if WhatsApp fails. Defaults to true.
      #
      #   @param html_body [String] HTML body for email messages. If provided, email will be sent as multipart with
      #
      #   @param idempotency_key [String] Optional idempotency key to avoid duplicate sends.
      #
      #   @param message_type [Symbol, Zavudev::Models::MessageType] Type of message. Defaults to 'text'.
      #
      #   @param metadata [Hash{Symbol=>String}] Arbitrary metadata to associate with the message.
      #
      #   @param reply_to [String] Reply-To email address for email messages.
      #
      #   @param subject [String] Email subject line. Required when channel is 'email' or recipient is an email ad
      #
      #   @param text [String] Text body for text messages or caption for media messages.
      #
      #   @param voice_language [String] Language code for voice text-to-speech (e.g., 'en-US', 'es-ES', 'pt-BR'). If omi
      #
      #   @param zavu_sender [String]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
