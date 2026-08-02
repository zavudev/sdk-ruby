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
      # @param channel [Symbol, Zavudev::Models::MessageListParams::Channel] Filter by delivery channel.
      #
      # @param cursor [String]
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::MessageListParams::Status] Filter by status. Not all stored statuses are filterable.
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
      # **Plan allowances and email billing:**
      #
      # - WhatsApp, Telegram, Instagram and Messenger share an allowance of 2,000
      #   messages per month on Free. Over it, sends return 429 with code
      #   `a2p_limit_exceeded` and upgrade details; the counter resets on the 1st of
      #   each month. Paid plans have no message caps
      # - Email is billed from your prepaid balance in 1,000-message blocks: $0.40 per
      #   1,000 transactional emails, $0.80 per 1,000 marketing (broadcast) emails. A
      #   block is charged when your monthly count crosses each 1,000 boundary, and at
      #   zero balance email sends return 402 with code `insufficient_balance`. Free
      #   teams start with $2 of credit and additionally cap at 3,000 emails/month and
      #   100/day. Teams on earlier plans keep their original email quotas instead
      # - SMS and voice are billed per message from your balance on every plan
      #
      # **Email recipient pre-flight:** Email messages are validated automatically
      # before dispatch. Sends that would be a guaranteed hard bounce are failed instead
      # of sent, protecting your bounce rate: the message transitions to `failed`
      # (visible via `GET /v1/messages/{messageId}` and the `message.failed` webhook)
      # with `errorCode` set to `EMAIL_INVALID_RECIPIENT` (malformed address),
      # `EMAIL_DOMAIN_NOT_FOUND` (recipient domain has no MX or A records), or
      # `EMAIL_RECIPIENT_SUPPRESSED` (address is on your suppression list after a
      # previous bounce or complaint). Advisory signals (role addresses, disposable
      # domains) do not block sends — check them beforehand with
      # `POST /v1/introspect/email`.
      #
      # @overload send_(to:, attachments: nil, channel: nil, content: nil, fallback_enabled: nil, html_body: nil, idempotency_key: nil, message_type: nil, metadata: nil, reply_to: nil, subject: nil, text: nil, voice_language: nil, zavu_sender: nil, request_options: {})
      #
      # @param to [String] Body param: Recipient phone number in E.164 format, email address, WhatsApp busi
      #
      # @param attachments [Array<Zavudev::Models::MessageSendParams::Attachment>] Body param: Email attachments. Only supported when channel is 'email'. Maximum 4
      #
      # @param channel [Symbol, Zavudev::Models::Channel] Body param: Delivery channel. Use 'auto' for intelligent routing. If omitted, ch
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

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::MessageShowTypingParams} for more details.
      #
      # Mark an inbound WhatsApp message as read and display a typing indicator to the
      # user while you prepare a response. The indicator is automatically dismissed when
      # you send a reply, or after 25 seconds — whichever comes first. Only valid for
      # inbound WhatsApp messages. Use this when a reply will take more than a couple of
      # seconds (LLM agent, tool call, lookup) to improve the recipient's experience.
      #
      # @overload show_typing(message_id, zavu_sender: nil, request_options: {})
      #
      # @param message_id [String]
      #
      # @param zavu_sender [String] Optional sender profile ID. If omitted, the project's default sender will be use
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::MessageShowTypingResponse]
      #
      # @see Zavudev::Models::MessageShowTypingParams
      def show_typing(message_id, params = {})
        parsed, options = Zavudev::MessageShowTypingParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/messages/%1$s/typing", message_id],
          headers: parsed.transform_keys(zavu_sender: "zavu-sender"),
          model: Zavudev::Models::MessageShowTypingResponse,
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
