# frozen_string_literal: true

module Zavudev
  module Models
    module Broadcasts
      # @see Zavudev::Resources::Broadcasts::Contacts#add
      class ContactAddResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute added
        #   Number of contacts successfully added.
        #
        #   @return [Integer]
        required :added, Integer

        # @!attribute duplicates
        #   Number of duplicate contacts skipped.
        #
        #   @return [Integer]
        required :duplicates, Integer

        # @!attribute invalid
        #   Number of invalid contacts rejected.
        #
        #   @return [Integer]
        required :invalid, Integer

        # @!attribute errors
        #   Details about invalid contacts.
        #
        #   @return [Array<Zavudev::Models::Broadcasts::ContactAddResponse::Error>, nil]
        optional :errors,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Broadcasts::ContactAddResponse::Error] }

        # @!method initialize(added:, duplicates:, invalid:, errors: nil)
        #   @param added [Integer] Number of contacts successfully added.
        #
        #   @param duplicates [Integer] Number of duplicate contacts skipped.
        #
        #   @param invalid [Integer] Number of invalid contacts rejected.
        #
        #   @param errors [Array<Zavudev::Models::Broadcasts::ContactAddResponse::Error>] Details about invalid contacts.

        class Error < Zavudev::Internal::Type::BaseModel
          # @!attribute reason
          #
          #   @return [String, nil]
          optional :reason, String

          # @!attribute recipient
          #
          #   @return [String, nil]
          optional :recipient, String

          # @!method initialize(reason: nil, recipient: nil)
          #   @param reason [String]
          #   @param recipient [String]
        end
      end
    end
  end
end
