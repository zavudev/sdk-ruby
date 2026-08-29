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
          channel: Zavudev::MessageListParams::Channel::OrSymbol,
          cursor: String,
          limit: Integer,
          status: Zavudev::MessageListParams::Status::OrSymbol,
          to: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Message])
      end
      def list(
        # Filter by delivery channel.
        channel: nil,
        cursor: nil,
        limit: nil,
        # Filter by status. Not all stored statuses are filterable.
        status: nil,
        to: nil,
        request_options: {}
      )
      end

      # List the stored file attachments for an email message and get a short-lived
      # signed `downloadUrl` for each. Works for both inbound emails (received via
      # `message.inbound`) and outbound emails you sent with attachments. Messages
      # without stored attachments (including SMS, WhatsApp, and other channels) return
      # an empty list. Each `downloadUrl` is generated fresh per request and expires —
      # fetch the file promptly and do not cache the URL.
      sig do
        params(
          message_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::MessageListAttachmentsResponse)
      end
      def list_attachments(message_id, request_options: {})
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
      # **Account verification and daily limits:**
      #
      # - A brand-new account can send on every channel immediately, but `sms`,
      #   `sms_oneway` and `voice` reach only the phone numbers the project has
      #   verified. Sending elsewhere returns `403` with code
      #   `destination_not_verified`; `details.verifiedNumbers` lists the numbers that
      #   are reachable. A number is verified from the dashboard's Sandbox screen:
      #   generate a code and send the pre-filled WhatsApp message from that phone to
      #   Zavu's sandbox number. One verification covers WhatsApp, SMS and calls, up to
      #   5 numbers per project. To send to any destination, do any one of these: verify
      #   your identity, add a payment method, settle a deposit, or subscribe to a paid
      #   plan. Business verification (KYB) is never required to send
      # - Daily ceilings apply per channel group and rise with verification. An account
      #   that has verified nothing: 25/day across `sms` + `sms_oneway`, 5/day for
      #   `voice`, 100/day across WhatsApp, Telegram, Instagram and Messenger combined.
      #   Past that floor: 200/day for SMS, or 10,000/day once identity or business
      #   verification is approved (or a higher limit agreed for your account); 50/day
      #   voice and 250/day conversational on Free. **Paid plans have no voice or
      #   conversational daily ceiling.** Over a ceiling, sends return `429` with code
      #   `daily_limit_exceeded` and `details.limit`; the count resets at 00:00 UTC
      # - The daily ceiling never reduces the monthly allowance: 100/day on the
      #   conversational group still reaches the 2,000 monthly A2P messages Free
      #   includes
      # - Email needs no account verification here: a sender with a verified domain
      #   sends from day one, within the plan quota (100/day and 3,000/month on Free).
      #   Over the daily quota it returns `429` with code `daily_limit_exceeded`. Email
      #   broadcasts are the exception: they need the account past the sandbox level,
      #   see `POST /v1/broadcasts/{broadcastId}/send`
      # - Full reference: https://docs.zavu.dev/concepts/sending-limits
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
        # Body param: Recipient phone number in E.164 format, email address, WhatsApp
        # business-scoped user ID (BSUID, e.g. `US.13491208655302741918`), or numeric chat
        # ID (for Telegram/Instagram/Messenger). A BSUID is routed to WhatsApp and sent
        # via the `recipient` field; use it to message a contact who adopted a username
        # and whose phone number is hidden.
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

      # Mark an inbound WhatsApp message as read and display a typing indicator to the
      # user while you prepare a response. The indicator is automatically dismissed when
      # you send a reply, or after 25 seconds — whichever comes first. Only valid for
      # inbound WhatsApp messages. Use this when a reply will take more than a couple of
      # seconds (LLM agent, tool call, lookup) to improve the recipient's experience.
      sig do
        params(
          message_id: String,
          zavu_sender: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::MessageShowTypingResponse)
      end
      def show_typing(
        message_id,
        # Optional sender profile ID. If omitted, the project's default sender will be
        # used.
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
