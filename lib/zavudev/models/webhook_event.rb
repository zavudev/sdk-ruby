# frozen_string_literal: true

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
    # **Broadcast events:**
    #
    # - `broadcast.status_changed`: Broadcast status changed (pending_review,
    #   approved, rejected, sending, completed, cancelled)
    #
    # **Other events:**
    #
    # - `conversation.new`: New conversation started with a contact
    # - `template.status_changed`: WhatsApp template approval status changed
    module WebhookEvent
      extend Zavudev::Internal::Type::Enum

      MESSAGE_QUEUED = :"message.queued"
      MESSAGE_SENT = :"message.sent"
      MESSAGE_DELIVERED = :"message.delivered"
      MESSAGE_READ = :"message.read"
      MESSAGE_FAILED = :"message.failed"
      MESSAGE_INBOUND = :"message.inbound"
      MESSAGE_UNSUPPORTED = :"message.unsupported"
      BROADCAST_STATUS_CHANGED = :"broadcast.status_changed"
      CONVERSATION_NEW = :"conversation.new"
      TEMPLATE_STATUS_CHANGED = :"template.status_changed"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
