# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#purchase
    class PhoneNumberPurchaseResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute phone_number
      #
      #   @return [Zavudev::Models::OwnedPhoneNumber]
      required :phone_number, -> { Zavudev::OwnedPhoneNumber }, api_name: :phoneNumber

      # @!method initialize(phone_number:)
      #   @param phone_number [Zavudev::Models::OwnedPhoneNumber]
    end
  end
end
