# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#search_available
    class PhoneNumberSearchAvailableResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Zavudev::Models::AvailablePhoneNumber>]
      required :items, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::AvailablePhoneNumber] }

      # @!method initialize(items:)
      #   @param items [Array<Zavudev::Models::AvailablePhoneNumber>]
    end
  end
end
