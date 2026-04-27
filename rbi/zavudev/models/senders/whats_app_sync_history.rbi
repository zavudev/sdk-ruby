# typed: strong

module Zavudev
  module Models
    module Senders
      class WhatsAppSyncHistory < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::WhatsAppSyncHistory,
              Zavudev::Internal::AnyHash
            )
          end

        # Whether history sync can be initiated.
        sig { returns(T::Boolean) }
        attr_accessor :can_sync

        # Status of WhatsApp message history sync.
        sig do
          returns(Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol)
        end
        attr_accessor :status

        # When the sync was completed.
        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        # When the sync was last requested.
        sig { returns(T.nilable(Time)) }
        attr_accessor :requested_at

        # History sync status details.
        sig do
          params(
            can_sync: T::Boolean,
            status: Zavudev::Senders::WhatsAppSyncHistory::Status::OrSymbol,
            completed_at: T.nilable(Time),
            requested_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether history sync can be initiated.
          can_sync:,
          # Status of WhatsApp message history sync.
          status:,
          # When the sync was completed.
          completed_at: nil,
          # When the sync was last requested.
          requested_at: nil
        )
        end

        sig do
          override.returns(
            {
              can_sync: T::Boolean,
              status:
                Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol,
              completed_at: T.nilable(Time),
              requested_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        # Status of WhatsApp message history sync.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Senders::WhatsAppSyncHistory::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NOT_REQUESTED =
            T.let(
              :not_requested,
              Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol
            )
          SYNCING =
            T.let(
              :syncing,
              Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol
            )
          REJECTED =
            T.let(
              :rejected,
              Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Senders::WhatsAppSyncHistory::Status::TaggedSymbol
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
