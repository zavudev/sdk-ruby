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

      # @!attribute regulatory_status
      #   Regulatory review state. Numbers that need no review are `approved` immediately.
      #   A number bought with regulatory information is owned and billed from purchase
      #   and starts `pending_review`; it cannot send messages or place calls until this
      #   is `approved`. The state is re-checked every 6 hours: poll
      #   `GET /v1/phone-numbers/{phoneNumberId}` to follow it.
      #
      #   Assign it to a sender with `PATCH /v1/phone-numbers/{phoneNumberId}`
      #   (`senderId`) before or after approval. A number assigned while under review is
      #   recorded and connected to that sender when it is approved; the connection is
      #   retried until it succeeds. A sender created over the API is set up for SMS as
      #   part of the assignment. `rejected` means review refused the information: the
      #   number cannot be assigned to a sender. A number that stays `pending_review` may
      #   be waiting on information the API cannot supply; contact support.
      #
      #   @return [Symbol, Zavudev::Models::OwnedPhoneNumber::RegulatoryStatus]
      required :regulatory_status,
               enum: -> { Zavudev::OwnedPhoneNumber::RegulatoryStatus },
               api_name: :regulatoryStatus

      # @!attribute status
      #   Billing state of an owned number, separate from `regulatoryStatus`. `pending` is
      #   legacy and is not written to numbers today. The SDKs carry `active`, `suspended`
      #   and `pending` only; `releasing` and `released` are returned by the REST API
      #   until their next release.
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

      # @!method initialize(id:, capabilities:, created_at:, phone_number:, pricing:, regulatory_status:, status:, name: nil, next_renewal_date: nil, sender_id: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::OwnedPhoneNumber} for more details.
      #
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
      #   @param regulatory_status [Symbol, Zavudev::Models::OwnedPhoneNumber::RegulatoryStatus] Regulatory review state. Numbers that need no review are `approved` immediately.
      #
      #   @param status [Symbol, Zavudev::Models::PhoneNumberStatus] Billing state of an owned number, separate from `regulatoryStatus`. `pending` is
      #
      #   @param name [String] Optional custom name for the phone number.
      #
      #   @param next_renewal_date [Time]
      #
      #   @param sender_id [String] Sender ID if the phone number is assigned to a sender.
      #
      #   @param updated_at [Time]

      # Regulatory review state. Numbers that need no review are `approved` immediately.
      # A number bought with regulatory information is owned and billed from purchase
      # and starts `pending_review`; it cannot send messages or place calls until this
      # is `approved`. The state is re-checked every 6 hours: poll
      # `GET /v1/phone-numbers/{phoneNumberId}` to follow it.
      #
      # Assign it to a sender with `PATCH /v1/phone-numbers/{phoneNumberId}`
      # (`senderId`) before or after approval. A number assigned while under review is
      # recorded and connected to that sender when it is approved; the connection is
      # retried until it succeeds. A sender created over the API is set up for SMS as
      # part of the assignment. `rejected` means review refused the information: the
      # number cannot be assigned to a sender. A number that stays `pending_review` may
      # be waiting on information the API cannot supply; contact support.
      #
      # @see Zavudev::Models::OwnedPhoneNumber#regulatory_status
      module RegulatoryStatus
        extend Zavudev::Internal::Type::Enum

        APPROVED = :approved
        PENDING_REVIEW = :pending_review
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
