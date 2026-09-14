# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Templates#sync
    class TemplateSyncResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute accounts_synced
      #   WhatsApp Business Accounts reconciled in this call.
      #
      #   @return [Integer]
      required :accounts_synced, Integer, api_name: :accountsSynced

      # @!attribute errors
      #   Problems hit while syncing. Non-empty with a 200 means part of the sync did not
      #   complete — the rest still did.
      #
      #   @return [Array<String>]
      required :errors, Zavudev::Internal::Type::ArrayOf[String]

      # @!attribute imported
      #   Templates that existed on Meta and were created in Zavu by this call.
      #
      #   @return [Integer]
      required :imported, Integer

      # @!attribute linked
      #   Existing Zavu templates that were matched to a Meta template by name and bound
      #   to its Meta ID.
      #
      #   @return [Integer]
      required :linked, Integer

      # @!attribute skipped
      #   Meta templates left alone: already linked to a Zavu template, or
      #   rejected/disabled on Meta.
      #
      #   @return [Integer]
      required :skipped, Integer

      # @!attribute updated
      #   Templates whose approval status changed to match Meta.
      #
      #   @return [Integer]
      required :updated, Integer

      # @!method initialize(accounts_synced:, errors:, imported:, linked:, skipped:, updated:)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::TemplateSyncResponse} for more details.
      #
      #   @param accounts_synced [Integer] WhatsApp Business Accounts reconciled in this call.
      #
      #   @param errors [Array<String>] Problems hit while syncing. Non-empty with a 200 means part of the sync did not
      #
      #   @param imported [Integer] Templates that existed on Meta and were created in Zavu by this call.
      #
      #   @param linked [Integer] Existing Zavu templates that were matched to a Meta template by name and bound t
      #
      #   @param skipped [Integer] Meta templates left alone: already linked to a Zavu template, or rejected/disabl
      #
      #   @param updated [Integer] Templates whose approval status changed to match Meta.
    end
  end
end
