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
    # - `message.inbound`: New message received from a contact. Reactions are
    #   delivered as `message.inbound` with `messageType='reaction'`
    # - `message.unsupported`: Received a message type that is not supported
    #
    # **Other events:**
    #
    # - `conversation.new`: New conversation started with a contact
    # - `template.status_changed`: WhatsApp template approval status changed
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
      MESSAGE_FAILED =
        T.let(:"message.failed", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_INBOUND =
        T.let(:"message.inbound", Zavudev::WebhookEvent::TaggedSymbol)
      MESSAGE_UNSUPPORTED =
        T.let(:"message.unsupported", Zavudev::WebhookEvent::TaggedSymbol)
      CONVERSATION_NEW =
        T.let(:"conversation.new", Zavudev::WebhookEvent::TaggedSymbol)
      TEMPLATE_STATUS_CHANGED =
        T.let(:"template.status_changed", Zavudev::WebhookEvent::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::WebhookEvent::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
