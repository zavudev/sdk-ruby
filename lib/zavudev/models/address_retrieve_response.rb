# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Addresses#retrieve
    class AddressRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute address
      #   A regulatory address for phone number requirements.
      #
      #   @return [Zavudev::Models::Address]
      required :address, -> { Zavudev::Address }

      # @!method initialize(address:)
      #   @param address [Zavudev::Models::Address] A regulatory address for phone number requirements.
    end
  end
end
