# typed: strong

module Zavudev
  module Models
    module Senders
      class WhatsAppSyncContacts < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::WhatsAppSyncContacts,
              Zavudev::Internal::AnyHash
            )
          end

        # Whether contacts sync can be initiated.
        sig { returns(T::Boolean) }
        attr_accessor :can_sync

        # Status of WhatsApp contacts sync.
        sig do
          returns(Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol)
        end
        attr_accessor :status

        # When the sync was last requested.
        sig { returns(T.nilable(Time)) }
        attr_accessor :requested_at

        # Contacts sync status details.
        sig do
          params(
            can_sync: T::Boolean,
            status: Zavudev::Senders::WhatsAppSyncContacts::Status::OrSymbol,
            requested_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether contacts sync can be initiated.
          can_sync:,
          # Status of WhatsApp contacts sync.
          status:,
          # When the sync was last requested.
          requested_at: nil
        )
        end

        sig do
          override.returns(
            {
              can_sync: T::Boolean,
              status:
                Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol,
              requested_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        # Status of WhatsApp contacts sync.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Senders::WhatsAppSyncContacts::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NOT_REQUESTED =
            T.let(
              :not_requested,
              Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol
            )
          SYNCING =
            T.let(
              :syncing,
              Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Senders::WhatsAppSyncContacts::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
