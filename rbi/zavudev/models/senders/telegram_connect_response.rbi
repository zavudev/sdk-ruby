# typed: strong

module Zavudev
  module Models
    module Senders
      class TelegramConnectResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Senders::TelegramConnectResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig do
          returns(Zavudev::Models::Senders::TelegramConnectResponse::Telegram)
        end
        attr_reader :telegram

        sig do
          params(
            telegram:
              Zavudev::Models::Senders::TelegramConnectResponse::Telegram::OrHash
          ).void
        end
        attr_writer :telegram

        sig do
          params(
            telegram:
              Zavudev::Models::Senders::TelegramConnectResponse::Telegram::OrHash
          ).returns(T.attached_class)
        end
        def self.new(telegram:)
        end

        sig do
          override.returns(
            {
              telegram:
                Zavudev::Models::Senders::TelegramConnectResponse::Telegram
            }
          )
        end
        def to_hash
        end

        class Telegram < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::TelegramConnectResponse::Telegram,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(T::Boolean) }
          attr_accessor :connected

          sig { returns(T.nilable(String)) }
          attr_reader :bot_id

          sig { params(bot_id: String).void }
          attr_writer :bot_id

          sig { returns(T.nilable(String)) }
          attr_reader :bot_username

          sig { params(bot_username: String).void }
          attr_writer :bot_username

          sig do
            params(
              connected: T::Boolean,
              bot_id: String,
              bot_username: String
            ).returns(T.attached_class)
          end
          def self.new(connected:, bot_id: nil, bot_username: nil)
          end

          sig do
            override.returns(
              { connected: T::Boolean, bot_id: String, bot_username: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
