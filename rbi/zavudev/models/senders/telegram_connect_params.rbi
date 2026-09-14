# typed: strong

module Zavudev
  module Models
    module Senders
      class TelegramConnectParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::TelegramConnectParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :sender_id

        # Bot token from @BotFather.
        sig { returns(String) }
        attr_accessor :bot_token

        sig do
          params(
            sender_id: String,
            bot_token: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          sender_id:,
          # Bot token from @BotFather.
          bot_token:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              sender_id: String,
              bot_token: String,
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
