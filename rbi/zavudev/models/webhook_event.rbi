# typed: strong

module Zavudev
  module Models
    # Type of event that triggers the webhook.
    #
    # **Message lifecycle events:**
    #
    # - `message.queued`: Message created and queued for sending. `data.status` =
    #   `queued`
    # - `message.sent`: Message accepted by the provider. `data.status` = `sent`
    # - `message.delivered`: Message delivered to recipient. `data.status` =
    #   `delivered`
    # - `message.read`: Message was read by the recipient (WhatsApp only).
    #   `data.status` = `read`
    # - `message.failed`: Message failed to send. `data.status` = `failed`
    #
    # **Inbound events:**
    #
    # - `message.inbound`: New message received from a contact. `data.conversationId`
    #   is the inbox thread id (deep-link with
    #   `https://dashboard.zavu.dev/{locale}/inbox?conv={conversationId}`); it is
    #   `null` while the conversation row is still being created (the first message of
    #   a brand-new thread, or several near-simultaneous first messages), where
    #   `conversation.new` carries the id instead — `GET /v1/messages/{messageId}`
    #   always has it. Reactions are delivered as `message.inbound` with
    #   `messageType='reaction'`. When the contact replied to (quoted) an earlier
    #   message, `data.content` carries the reply context: `replyToMessageId`,
    #   `replyToProviderMessageId`, `replyToFrom`, `replyToText`, and
    #   `replyToMessageType`. `data.providerTimestamp` is the provider's original
    #   receive time in Unix milliseconds (the moment the channel received the message
    #   from the contact — WhatsApp, Telegram, Instagram, Messenger; `null` for SMS
    #   and email). Compare it against the top-level `timestamp` (when Zavu dispatched
    #   the webhook) to detect and ignore delayed deliveries.
    # - `message.unsupported`: Received a message type that is not supported
    #
    # **Broadcast events:**
    #
    # - `broadcast.status_changed`: Broadcast status changed (pending_review,
    #   approved, rejected, sending, completed, cancelled)
    #
    # **Other events:**
    #
    # - `conversation.new`: New conversation started with a contact. `data` carries
    #   `conversationId` (the inbox thread id — deep-link with
    #   `https://dashboard.zavu.dev/{locale}/inbox?conv={conversationId}`), the
    #   `phoneNumber` or `email` key, `channel`, `firstMessageId`, `firstMessageText`,
    #   and `profileName`.
    # - `template.status_changed`: WhatsApp template approval status changed
    #
    # **Partner events:**
    #
    # - `invitation.status_changed`: A partner invitation status changed (pending,
    #   in_progress, completed, cancelled, failed). `data` carries `invitationId`,
    #   `clientName`, `clientEmail`, `connectionType` (`whatsapp_waba` or
    #   `messenger`), `previousStatus`, and `currentStatus`. On `completed` it also
    #   carries `senderId` and `connectedAccount` (`channel`, `id`, `name`) — the
    #   WhatsApp number or Facebook Page that was linked. On `failed` it carries
    #   `failureReason`; the invitation link stays usable, so a client can retry it.
    #
    # **Voice Agent events:** For every voice event, `data` carries `callId`,
    # `direction`, `from`, `to`, `status`, `durationSeconds`, `endReason`, and
    # `transcriptAvailable`. The terminal events (`call.completed`, `call.failed`)
    # additionally carry `cost` — what the call was billed, in USD, combining
    # telephony and the managed voice pipeline — and `currency`. They are dispatched
    # after the call is charged, so `cost` is populated rather than zero; telephony
    # can still be settling on an outbound call, in which case
    # `GET /v1/calls/{callId}` holds the reconciled figure.
    #
    # - `call.initiated`: An outbound call was created and is dialing, or an inbound
    #   call was received. `data.status` = `ringing`
    # - `call.answered`: The call was answered and the voice agent is connected.
    #   `data.status` = `in_progress`
    # - `call.completed`: The call ended after a conversation. `data.status` =
    #   `completed`; `durationSeconds` and `endReason` describe how it ended, and
    #   `transcriptAvailable` indicates whether a transcript can be fetched.
    # - `call.failed`: The call could not be completed (busy, no answer, canceled, or
    #   an error). `data.status` is the terminal status and `endReason` explains the
    #   cause.
    #
    # **Custom domain events:**
    #
    # - `domain.verified`: A custom email domain passed verification (DKIM, and
    #   SPF/DMARC/MAIL FROM if enhanced records are enabled)
    # - `domain.failed`: A custom email domain failed verification or is partially
    #   verified
    module WebhookEvent
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::WebhookEvent) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      MESSAGE_QUEUED =
        T.let(:"message.queued", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_SENT = T.let(:"message.sent", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_DELIVERED =
        T.let(:"message.delivered", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_READ = T.let(:"message.read", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_STATUS =
        T.let(:"message.status", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_FAILED =
        T.let(:"message.failed", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_INBOUND =
        T.let(:"message.inbound", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_UNSUPPORTED =
        T.let(:"message.unsupported", Zavudev::WebhookEvent::TaggedSymbol)
      BROADCAST_STATUS_CHANGED =
        T.let(:"broadcast.status_changed", Zavudev::WebhookEvent::TaggedSymbol)
      CONVERSATION_NEW =
        T.let(:"conversation.new", Zavudev::WebhookEvent::TaggedSymbol)
      TEMPLATE_STATUS_CHANGED =
        T.let(:"template.status_changed", Zavudev::WebhookEvent::TaggedSymbol)
      INVITATION_STATUS_CHANGED =
        T.let(:"invitation.status_changed", Zavudev::WebhookEvent::TaggedSymbol)
      CALL_INITIATED =
        T.let(:"call.initiated", Zavudev::WebhookEvent::TaggedSymbol)
      CALL_ANSWERED =
        T.let(:"call.answered", Zavudev::WebhookEvent::TaggedSymbol)
      CALL_COMPLETED =
        T.let(:"call.completed", Zavudev::WebhookEvent::TaggedSymbol)
      CALL_FAILED = T.let(:"call.failed", Zavudev::WebhookEvent::TaggedSymbol)
      DOMAIN_VERIFIED =
        T.let(:"domain.verified", Zavudev::WebhookEvent::TaggedSymbol)
      DOMAIN_FAILED =
        T.let(:"domain.failed", Zavudev::WebhookEvent::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::WebhookEvent::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
