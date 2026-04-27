# typed: strong

module Zavudev
  module Models
    module Senders
      class WhatsappSyncRetrieveResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Senders::WhatsappSyncRetrieveResponse,
              Zavudev::Internal::AnyHash
            )
          end

        # WhatsApp coexistence sync status.
        sig { returns(Zavudev::Senders::WhatsAppSyncStatus) }
        attr_reader :sync

        sig { params(sync: Zavudev::Senders::WhatsAppSyncStatus::OrHash).void }
        attr_writer :sync

        sig do
          params(sync: Zavudev::Senders::WhatsAppSyncStatus::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # WhatsApp coexistence sync status.
          sync:
        )
        end

        sig { override.returns({ sync: Zavudev::Senders::WhatsAppSyncStatus }) }
        def to_hash
        end
      end
    end
  end
end
