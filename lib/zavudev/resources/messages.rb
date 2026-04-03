# frozen_string_literal: true

module Zavudev
  module Resources
    class Messages
      # Get message by ID
      #
      # @overload retrieve(message_id, request_options: {})
      #
      # @param message_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::MessageResponse]
      #
      # @see Zavudev::Models::MessageRetrieveParams
      def retrieve(message_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/messages/%1$s", message_id],
          model: Zavudev::MessageResponse,
          options: params[:request_options]
        )
      end

      # List messages previously sent by this project.
      #
      # @overload list(channel: nil, cursor: nil, limit: nil, status: nil, to: nil, request_options: {})
      #
      # @param channel [Symbol, Zavudev::Models::Channel] Delivery channel. Use 'auto' for intelligent routing.
      #
      # @param cursor [String]
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::MessageStatus]
      #
      # @param to [String]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Message>]
      #
      # @see Zavudev::Models::MessageListParams
      def list(params = {})
        parsed, options = Zavudev::MessageListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/messages",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Message,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::MessageReactParams} for more details.
      #
      # Send an emoji reaction to an existing WhatsApp message. Reactions are only
      # supported for WhatsApp messages.
      #
      # @overload react(message_id, emoji:, zavu_sender: nil, request_options: {})
      #
      # @param message_id [String] Path param
      #
      # @param emoji [String] Body param: Single emoji character to react with.
      #
      # @param zavu_sender [String] Header param: Optional sender profile ID. If omitted, the project's default send
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::MessageResponse]
      #
      # @see Zavudev::Models::MessageReactParams
      def react(message_id, params)
        parsed, options = Zavudev::MessageReactParams.dump_request(params)
        header_params = {zavu_sender: "zavu-sender"}
        @client.request(
          method: :post,
          path: ["v1/messages/%1$s/reactions", message_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Zavudev::MessageResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::MessageSendParams} for more details.
      #
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
      #
      # @overload send_(to:, attachments: nil, channel: nil, content: nil, fallback_enabled: nil, html_body: nil, idempotency_key: nil, message_type: nil, metadata: nil, reply_to: nil, subject: nil, text: nil, voice_language: nil, zavu_sender: nil, request_options: {})
      #
      # @param to [String] Body param: Recipient phone number in E.164 format, email address, or numeric ch
      #
      # @param attachments [Array<Zavudev::Models::MessageSendParams::Attachment>] Body param: Email attachments. Only supported when channel is 'email'. Maximum 4
      #
      # @param channel [Symbol, Zavudev::Models::Channel] Body param: Delivery channel. Use 'auto' for intelligent routing. If omitted wit
      #
      # @param content [Zavudev::Models::MessageContent] Body param: Additional content for non-text message types.
      #
      # @param fallback_enabled [Boolean] Body param: Whether to enable automatic fallback to SMS if WhatsApp fails. Defau
      #
      # @param html_body [String] Body param: HTML body for email messages. If provided, email will be sent as mul
      #
      # @param idempotency_key [String] Body param: Optional idempotency key to avoid duplicate sends.
      #
      # @param message_type [Symbol, Zavudev::Models::MessageType] Body param: Type of message. Defaults to 'text'.
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Arbitrary metadata to associate with the message.
      #
      # @param reply_to [String] Body param: Reply-To email address for email messages.
      #
      # @param subject [String] Body param: Email subject line. Required when channel is 'email' or recipient is
      #
      # @param text [String] Body param: Text body for text messages or caption for media messages.
      #
      # @param voice_language [String] Body param: Language code for voice text-to-speech (e.g., 'en-US', 'es-ES', 'pt-
      #
      # @param zavu_sender [String] Header param: Optional sender profile ID. If omitted, the project's default send
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::MessageResponse]
      #
      # @see Zavudev::Models::MessageSendParams
      def send_(params)
        parsed, options = Zavudev::MessageSendParams.dump_request(params)
        header_params = {zavu_sender: "zavu-sender"}
        @client.request(
          method: :post,
          path: "v1/messages",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Zavudev::MessageResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
