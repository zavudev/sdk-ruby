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
      #   messages per month on Free. **It counts messages in both directions**: a
      #   message a contact sends you consumes one unit exactly as a message you send
      #   them does, so a project that has sent 300 and received 1,700 has used the
      #   whole allowance. Messages you send from the WhatsApp Business App on your own
      #   phone under coexistence are mirrored into your inbox but never counted, and
      #   neither are failed sends. Over the allowance, sends return 429 with code
      #   `a2p_limit_exceeded` and upgrade details, **and inbound messages on those
      #   channels are refused as well**: not stored, not shown in the inbox, and no
      #   `message.inbound` webhook, and not delivered later when the month resets. The
      #   counter resets on the 1st of each month. Paid plans have no message caps
      # - Email is billed from your prepaid balance in 1,000-message blocks: $0.40 per
      #   1,000 transactional emails, $0.80 per 1,000 marketing (broadcast) emails. A
      #   block is charged when your monthly count crosses each 1,000 boundary, and at
      #   zero balance email sends return 402 with code `insufficient_balance`. Free
      #   teams start with $2 of credit and additionally cap at 3,000 emails/month and
      #   100/day. Teams on earlier plans keep their original email quotas instead
      # - SMS and voice are billed per message from your balance on every plan
      #
      # **Daily limits:**
      #
      # - An account sends on every channel from its first minute, to any destination.
      #   Verification is not a permission to send: identity verification and business
      #   verification (KYB) raise the ceilings below and nothing else asks for them
      #   here. KYB is still required to register a 10DLC brand and campaign, which
      #   every US and Canadian (+1) SMS destination needs — a carrier rule, answered
      #   separately with `403 ten_dlc_required`
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
      # - Email: a sender with a verified domain sends from day one, within the plan
      #   quota (100/day and 3,000/month on Free). Over the daily quota it returns `429`
      #   with code `daily_limit_exceeded`
      # - Full reference: https://docs.zavu.dev/concepts/sending-limits
      #
      # **Risk review:** Every outbound `sms`, `sms_oneway`, `email` and `voice` message
      # is read before it is sent — the content, and how this account has been sending.
      # What is checked is the message, not who you are.
      #
      # - A message can be **held** for a short review. It stays `queued` while it
      #   waits: no new status exists for this, and `MessageStatus` is unchanged. When
      #   it is approved it sends normally.
      # - A message that is not approved moves to `failed` and fires `message.failed`.
      #   `errorCode` says which happened: `RISK_REJECTED` (a reviewer refused it),
      #   `RISK_REVIEW_EXPIRED` (the review window closed first — it is a couple of
      #   hours, because a code that arrives late is worse than one that does not
      #   arrive), or `RISK_BLOCKED` (refused outright, without a hold). An SMS that
      #   fails this way is not charged; the prepaid amount is returned.
      # - A call is never held. `POST /v1/calls` fails a call the review stops rather
      #   than placing it hours late.
      # - A message whose content cannot be read — the check is briefly unavailable — is
      #   held rather than sent. An account with an approved business verification is
      #   unaffected, and so is one that has verified something, already sends real
      #   traffic, and has a clean recent record.
      # - Repeated refusals suspend an account's sending. While it is suspended every
      #   send is refused with `403` and code `sending_suspended`,
      #   `details.dashboardUrl` points at support, and a message already queued fails
      #   with `errorCode` `SENDING_SUSPENDED`.
      # - A broadcast is read once, on the broadcast itself, rather than per recipient —
      #   see `POST /v1/broadcasts/{broadcastId}/send`.
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
