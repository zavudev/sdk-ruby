# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#list
    class OwnedPhoneNumber < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute capabilities
      #
      #   @return [Array<String>]
      required :capabilities, Zavudev::Internal::Type::ArrayOf[String]

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute pricing
      #
      #   @return [Zavudev::Models::OwnedPhoneNumberPricing]
      required :pricing, -> { Zavudev::OwnedPhoneNumberPricing }

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::PhoneNumberStatus]
      required :status, enum: -> { Zavudev::PhoneNumberStatus }

      # @!attribute name
      #   Optional custom name for the phone number.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute next_renewal_date
      #
      #   @return [Time, nil]
      optional :next_renewal_date, Time, api_name: :nextRenewalDate

      # @!attribute sender_id
      #   Sender ID if the phone number is assigned to a sender.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, capabilities:, created_at:, phone_number:, pricing:, status:, name: nil, next_renewal_date: nil, sender_id: nil, updated_at: nil)
      #   @param id [String]
      #
      #   @param capabilities [Array<String>]
      #
      #   @param created_at [Time]
      #
      #   @param phone_number [String]
      #
      #   @param pricing [Zavudev::Models::OwnedPhoneNumberPricing]
      #
      #   @param status [Symbol, Zavudev::Models::PhoneNumberStatus]
      #
      #   @param name [String] Optional custom name for the phone number.
      #
      #   @param next_renewal_date [Time]
      #
      #   @param sender_id [String] Sender ID if the phone number is assigned to a sender.
      #
      #   @param updated_at [Time]
    end
  end
end
