# typed: strong

module Zavudev
  module Models
    class TemplateSyncResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::TemplateSyncResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # WhatsApp Business Accounts reconciled in this call.
      sig { returns(Integer) }
      attr_accessor :accounts_synced

      # Problems hit while syncing. Non-empty with a 200 means part of the sync did not
      # complete — the rest still did.
      sig { returns(T::Array[String]) }
      attr_accessor :errors

      # Templates that existed on Meta and were created in Zavu by this call.
      sig { returns(Integer) }
      attr_accessor :imported

      # Existing Zavu templates that were matched to a Meta template by name and bound
      # to its Meta ID.
      sig { returns(Integer) }
      attr_accessor :linked

      # Meta templates left alone: already linked to a Zavu template, or
      # rejected/disabled on Meta.
      sig { returns(Integer) }
      attr_accessor :skipped

      # Templates whose approval status changed to match Meta.
      sig { returns(Integer) }
      attr_accessor :updated

      sig do
        params(
          accounts_synced: Integer,
          errors: T::Array[String],
          imported: Integer,
          linked: Integer,
          skipped: Integer,
          updated: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # WhatsApp Business Accounts reconciled in this call.
        accounts_synced:,
        # Problems hit while syncing. Non-empty with a 200 means part of the sync did not
        # complete — the rest still did.
        errors:,
        # Templates that existed on Meta and were created in Zavu by this call.
        imported:,
        # Existing Zavu templates that were matched to a Meta template by name and bound
        # to its Meta ID.
        linked:,
        # Meta templates left alone: already linked to a Zavu template, or
        # rejected/disabled on Meta.
        skipped:,
        # Templates whose approval status changed to match Meta.
        updated:
      )
      end

      sig do
        override.returns(
          {
            accounts_synced: Integer,
            errors: T::Array[String],
            imported: Integer,
            linked: Integer,
            skipped: Integer,
            updated: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
