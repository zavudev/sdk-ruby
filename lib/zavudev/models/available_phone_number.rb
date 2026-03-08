# frozen_string_literal: true

module Zavudev
  module Models
    class AvailablePhoneNumber < Zavudev::Internal::Type::BaseModel
      # @!attribute capabilities
      #
      #   @return [Zavudev::Models::PhoneNumberCapabilities]
      required :capabilities, -> { Zavudev::PhoneNumberCapabilities }

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute pricing
      #
      #   @return [Zavudev::Models::PhoneNumberPricing]
      required :pricing, -> { Zavudev::PhoneNumberPricing }

      # @!attribute friendly_name
      #
      #   @return [String, nil]
      optional :friendly_name, String, api_name: :friendlyName

      # @!attribute locality
      #
      #   @return [String, nil]
      optional :locality, String

      # @!attribute region
      #
      #   @return [String, nil]
      optional :region, String

      # @!method initialize(capabilities:, phone_number:, pricing:, friendly_name: nil, locality: nil, region: nil)
      #   @param capabilities [Zavudev::Models::PhoneNumberCapabilities]
      #   @param phone_number [String]
      #   @param pricing [Zavudev::Models::PhoneNumberPricing]
      #   @param friendly_name [String]
      #   @param locality [String]
      #   @param region [String]
    end
  end
end
