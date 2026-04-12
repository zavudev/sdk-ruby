# typed: strong

module Zavudev
  module Resources
    class Messages
      # Get message by ID
      sig do
        params(
          message_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::MessageResponse)
      end
      def retrieve(message_id, request_options: {})
      end

      # List messages previously sent by this project.
      sig do
        params(
          channel: Zavudev::Channel::OrSymbol,
          cursor: String,
          limit: Integer,
          status: Zavudev::MessageStatus::OrSymbol,
          to: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Message])
      end
      def list(
        # Delivery channel. Use 'auto' for intelligent routing.
        channel: nil,
        cursor: nil,
        limit: nil,
        status: nil,
        to: nil,
        request_options: {}
      )
      end

      # Send an emoji reaction to an existing WhatsApp message. Reactions are only
      # supported for WhatsApp messages.
      sig do
        params(
          message_id: String,
          emoji: String,
          zavu_sender: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::MessageResponse)
      end
      def react(
        # Path param
        message_id,
        # Body param: Single emoji character to react with.
        emoji:,
        # Header param: Optional sender profile ID. If omitted, the project's default
        # sender will be used.
        zavu_sender: nil,
        request_options: {}
      )
      end

      # Send a message to a recipient via SMS or WhatsApp.
      #
      # **Channel selection:**
      #
      # - If `channel` is omitted and `messageType` is `text`, defaults to SMS
      # - If `messageType` is anything other than `text`, WhatsApp is used automatically
      #
      # **WhatsApp 24-hour window:**
      #
      # - Free-form messages (non-template) require an open 24h window
      # - Window opens when the user messages you first
      # - Use template messages to initiate conversations outside the window
      #
      # **Daily limits:**
      #
      # - Unverified accounts: 200 messages per channel per day
      # - Complete KYC verification to increase limits to 10,000/day
      sig do
        params(
          to: String,
          attachments: T::Array[Zavudev::MessageSendParams::Attachment::OrHash],
          channel: Zavudev::Channel::OrSymbol,
          content: Zavudev::MessageContent::OrHash,
          fallback_enabled: T::Boolean,
          html_body: String,
          idempotency_key: String,
          message_type: Zavudev::MessageType::OrSymbol,
          metadata: T::Hash[Symbol, String],
          reply_to: String,
          subject: String,
          text: String,
          voice_language: String,
          zavu_sender: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::MessageResponse)
      end
      def send_(
        # Body param: Recipient phone number in E.164 format, email address, or numeric
        # chat ID (for Telegram/Instagram).
        to:,
        # Body param: Email attachments. Only supported when channel is 'email'. Maximum
        # 40MB total size.
        attachments: nil,
        # Body param: Delivery channel. Use 'auto' for intelligent routing. If omitted,
        # channel is auto-selected based on sender capabilities and recipient type. For
        # email recipients, defaults to 'email'.
        channel: nil,
        # Body param: Additional content for non-text message types.
        content: nil,
        # Body param: Whether to enable automatic fallback to SMS if WhatsApp fails.
        # Defaults to true.
        fallback_enabled: nil,
        # Body param: HTML body for email messages. If provided, email will be sent as
        # multipart with both text and HTML.
        html_body: nil,
        # Body param: Optional idempotency key to avoid duplicate sends.
        idempotency_key: nil,
        # Body param: Type of message. Defaults to 'text'.
        message_type: nil,
        # Body param: Arbitrary metadata to associate with the message.
        metadata: nil,
        # Body param: Reply-To email address for email messages.
        reply_to: nil,
        # Body param: Email subject line. Required when channel is 'email' or recipient is
        # an email address.
        subject: nil,
        # Body param: Text body for text messages or caption for media messages.
        text: nil,
        # Body param: Language code for voice text-to-speech (e.g., 'en-US', 'es-ES',
        # 'pt-BR'). If omitted, language is auto-detected from recipient's country code.
        voice_language: nil,
        # Header param: Optional sender profile ID. If omitted, the project's default
        # sender will be used.
        zavu_sender: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
