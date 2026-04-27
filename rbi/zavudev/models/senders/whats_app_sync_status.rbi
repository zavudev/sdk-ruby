# typed: strong

module Zavudev
  module Models
    module Senders
      class WhatsAppSyncStatus < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::WhatsAppSyncStatus,
              Zavudev::Internal::AnyHash
            )
          end

        # Contacts sync status details.
        sig { returns(Zavudev::Senders::WhatsAppSyncContacts) }
        attr_reader :contacts

        sig do
          params(contacts: Zavudev::Senders::WhatsAppSyncContacts::OrHash).void
        end
        attr_writer :contacts

        # History sync status details.
        sig { returns(Zavudev::Senders::WhatsAppSyncHistory) }
        attr_reader :history

        sig do
          params(history: Zavudev::Senders::WhatsAppSyncHistory::OrHash).void
        end
        attr_writer :history

        # Whether the account is in coexistence mode.
        sig { returns(T::Boolean) }
        attr_accessor :is_coexistence

        # WhatsApp account status.
        sig do
          returns(Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol)
        end
        attr_accessor :status

        # WhatsApp coexistence sync status.
        sig do
          params(
            contacts: Zavudev::Senders::WhatsAppSyncContacts::OrHash,
            history: Zavudev::Senders::WhatsAppSyncHistory::OrHash,
            is_coexistence: T::Boolean,
            status: Zavudev::Senders::WhatsAppSyncStatus::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Contacts sync status details.
          contacts:,
          # History sync status details.
          history:,
          # Whether the account is in coexistence mode.
          is_coexistence:,
          # WhatsApp account status.
          status:
        )
        end

        sig do
          override.returns(
            {
              contacts: Zavudev::Senders::WhatsAppSyncContacts,
              history: Zavudev::Senders::WhatsAppSyncHistory,
              is_coexistence: T::Boolean,
              status: Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # WhatsApp account status.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Senders::WhatsAppSyncStatus::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING_VERIFICATION =
            T.let(
              :pending_verification,
              Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
            )
          PENDING_REGISTRATION =
            T.let(
              :pending_registration,
              Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
            )
          DISCONNECTED =
            T.let(
              :disconnected,
              Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
            )
          ERROR =
            T.let(
              :error,
              Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Senders::WhatsAppSyncStatus::Status::TaggedSymbol
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
