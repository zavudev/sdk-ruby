# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Telegram
        # Connect a Telegram bot to a sender. Provide the bot token from @BotFather; Zavu
        # validates it, registers the webhook, and routes the sender's Telegram messages
        # through it.
        #
        # @overload connect(sender_id, bot_token:, request_options: {})
        #
        # @param sender_id [String]
        #
        # @param bot_token [String] Bot token from @BotFather.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::TelegramConnectResponse]
        #
        # @see Zavudev::Models::Senders::TelegramConnectParams
        def connect(sender_id, params)
          parsed, options = Zavudev::Senders::TelegramConnectParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/senders/%1$s/telegram", sender_id],
            body: parsed,
            model: Zavudev::Models::Senders::TelegramConnectResponse,
            options: options
          )
        end

        # Disconnect Telegram from a sender and remove the webhook.
        #
        # @overload disconnect(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Senders::TelegramDisconnectParams
        def disconnect(sender_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/senders/%1$s/telegram", sender_id],
            model: NilClass,
            options: params[:request_options]
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
end
