# typed: strong

module Zavudev
  module Models
    module Broadcasts
      class ContactListParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Broadcasts::ContactListParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :broadcast_id

        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Status of a contact within a broadcast.
        #
        # - `pending`, `queued`, `sending`: not handed to the provider yet.
        # - `sent`: accepted by the provider; delivery is not confirmed yet. Channels that
        #   never report delivery leave the recipient here.
        # - `delivered`: the channel confirmed delivery to the device. A WhatsApp read
        #   receipt also counts as delivered.
        # - `failed`: not delivered. A recipient can move from `sent` or `delivered` to
        #   `failed` when the provider reports a failure late.
        # - `skipped`: not sent, because the recipient opted out of the channel or the
        #   broadcast was cancelled before reaching it.
        sig { returns(T.nilable(Zavudev::BroadcastContactStatus::OrSymbol)) }
        attr_reader :status

        sig { params(status: Zavudev::BroadcastContactStatus::OrSymbol).void }
        attr_writer :status

        sig do
          params(
            broadcast_id: String,
            cursor: String,
            limit: Integer,
            status: Zavudev::BroadcastContactStatus::OrSymbol,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          broadcast_id:,
          cursor: nil,
          limit: nil,
          # Status of a contact within a broadcast.
          #
          # - `pending`, `queued`, `sending`: not handed to the provider yet.
          # - `sent`: accepted by the provider; delivery is not confirmed yet. Channels that
          #   never report delivery leave the recipient here.
          # - `delivered`: the channel confirmed delivery to the device. A WhatsApp read
          #   receipt also counts as delivered.
          # - `failed`: not delivered. A recipient can move from `sent` or `delivered` to
          #   `failed` when the provider reports a failure late.
          # - `skipped`: not sent, because the recipient opted out of the channel or the
          #   broadcast was cancelled before reaching it.
          status: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              broadcast_id: String,
              cursor: String,
              limit: Integer,
              status: Zavudev::BroadcastContactStatus::OrSymbol,
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
