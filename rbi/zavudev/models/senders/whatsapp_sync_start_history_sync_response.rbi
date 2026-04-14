# typed: strong

module Zavudev
  module Models
    module Senders
      class WhatsappSyncStartHistorySyncResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Senders::WhatsappSyncStartHistorySyncResponse,
              Zavudev::Internal::AnyHash
            )
          end

        # Success message.
        sig { returns(String) }
        attr_accessor :message

        # WhatsApp coexistence sync status.
        sig { returns(Zavudev::Senders::WhatsAppSyncStatus) }
        attr_reader :sync

        sig { params(sync: Zavudev::Senders::WhatsAppSyncStatus::OrHash).void }
        attr_writer :sync

        sig do
          params(
            message: String,
            sync: Zavudev::Senders::WhatsAppSyncStatus::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Success message.
          message:,
          # WhatsApp coexistence sync status.
          sync:
        )
        end

        sig do
          override.returns(
            { message: String, sync: Zavudev::Senders::WhatsAppSyncStatus }
          )
        end
        def to_hash
        end
      end
    end
  end
end
