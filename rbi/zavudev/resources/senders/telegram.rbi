# typed: strong

module Zavudev
  module Resources
    class Senders
      class Telegram
        # Connect a Telegram bot to a sender. Provide the bot token from @BotFather; Zavu
        # validates it, registers the webhook, and routes the sender's Telegram messages
        # through it.
        sig do
          params(
            sender_id: String,
            bot_token: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Senders::TelegramConnectResponse)
        end
        def connect(
          sender_id,
          # Bot token from @BotFather.
          bot_token:,
          request_options: {}
        )
        end

        # Disconnect Telegram from a sender and remove the webhook.
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def disconnect(sender_id, request_options: {})
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
