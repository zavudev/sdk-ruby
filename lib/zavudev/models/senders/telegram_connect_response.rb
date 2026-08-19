# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::Telegram#connect
      class TelegramConnectResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute telegram
        #
        #   @return [Zavudev::Models::Senders::TelegramConnectResponse::Telegram]
        required :telegram, -> { Zavudev::Models::Senders::TelegramConnectResponse::Telegram }

        # @!method initialize(telegram:)
        #   @param telegram [Zavudev::Models::Senders::TelegramConnectResponse::Telegram]

        # @see Zavudev::Models::Senders::TelegramConnectResponse#telegram
        class Telegram < Zavudev::Internal::Type::BaseModel
          # @!attribute connected
          #
          #   @return [Boolean]
          required :connected, Zavudev::Internal::Type::Boolean

          # @!attribute bot_id
          #
          #   @return [String, nil]
          optional :bot_id, String, api_name: :botId

          # @!attribute bot_username
          #
          #   @return [String, nil]
          optional :bot_username, String, api_name: :botUsername

          # @!method initialize(connected:, bot_id: nil, bot_username: nil)
          #   @param connected [Boolean]
          #   @param bot_id [String]
          #   @param bot_username [String]
        end
      end
    end
  end
end
