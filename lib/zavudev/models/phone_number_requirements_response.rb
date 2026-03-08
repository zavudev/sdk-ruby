# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#requirements
    class PhoneNumberRequirementsResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Zavudev::Models::Requirement>]
      required :items, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Requirement] }

      # @!method initialize(items:)
      #   @param items [Array<Zavudev::Models::Requirement>]
    end
  end
end
