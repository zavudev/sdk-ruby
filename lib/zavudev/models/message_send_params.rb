# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#send_
    class MessageSendParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute to
      #   Recipient phone number in E.164 format, email address, or numeric chat ID (for
      #   Telegram/Instagram).
      #
      #   @return [String]
      required :to, String

      # @!attribute attachments
      #   Email attachments. Only supported when channel is 'email'. Maximum 40MB total
      #   size.
      #
      #   @return [Array<Zavudev::Models::MessageSendParams::Attachment>, nil]
      optional :attachments, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::MessageSendParams::Attachment] }

      # @!attribute channel
      #   Delivery channel. Use 'auto' for intelligent routing. If omitted, channel is
      #   auto-selected based on sender capabilities and recipient type. For email
      #   recipients, defaults to 'email'.
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

      # @!method initialize(to:, attachments: nil, channel: nil, content: nil, fallback_enabled: nil, html_body: nil, idempotency_key: nil, message_type: nil, metadata: nil, reply_to: nil, subject: nil, text: nil, voice_language: nil, zavu_sender: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::MessageSendParams} for more details.
      #
      #   @param to [String] Recipient phone number in E.164 format, email address, or numeric chat ID (for T
      #
      #   @param attachments [Array<Zavudev::Models::MessageSendParams::Attachment>] Email attachments. Only supported when channel is 'email'. Maximum 40MB total si
      #
      #   @param channel [Symbol, Zavudev::Models::Channel] Delivery channel. Use 'auto' for intelligent routing. If omitted, channel is aut
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

      class Attachment < Zavudev::Internal::Type::BaseModel
        # @!attribute filename
        #   Name of the attached file.
        #
        #   @return [String]
        required :filename, String

        # @!attribute content
        #   Content of the attached file as a Base64-encoded string.
        #
        #   @return [String, nil]
        optional :content, String

        # @!attribute content_id
        #   Content ID for inline images. Reference in HTML as
        #   `<img src="cid:your_content_id">`.
        #
        #   @return [String, nil]
        optional :content_id, String

        # @!attribute content_type
        #   MIME type of the attachment. If not set, will be derived from the filename.
        #
        #   @return [String, nil]
        optional :content_type, String

        # @!attribute path
        #   URL where the attachment file is hosted. The server will fetch the file.
        #
        #   @return [String, nil]
        optional :path, String

        # @!method initialize(filename:, content: nil, content_id: nil, content_type: nil, path: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::MessageSendParams::Attachment} for more details.
        #
        #   Email attachment. Provide either `content` (base64) or `path` (URL), not both.
        #
        #   @param filename [String] Name of the attached file.
        #
        #   @param content [String] Content of the attached file as a Base64-encoded string.
        #
        #   @param content_id [String] Content ID for inline images. Reference in HTML as `<img src="cid:your_content_i
        #
        #   @param content_type [String] MIME type of the attachment. If not set, will be derived from the filename.
        #
        #   @param path [String] URL where the attachment file is hosted. The server will fetch the file.
      end
    end
  end
end
