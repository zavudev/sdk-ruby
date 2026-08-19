# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::Telegram#connect
      class TelegramConnectParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute sender_id
        #
        #   @return [String]
        required :sender_id, String

        # @!attribute bot_token
        #   Bot token from @BotFather.
        #
        #   @return [String]
        required :bot_token, String, api_name: :botToken

        # @!method initialize(sender_id:, bot_token:, request_options: {})
        #   @param sender_id [String]
        #
        #   @param bot_token [String] Bot token from @BotFather.
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
