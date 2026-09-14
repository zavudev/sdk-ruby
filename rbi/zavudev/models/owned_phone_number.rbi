# typed: strong

module Zavudev
  module Models
    class OwnedPhoneNumber < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::OwnedPhoneNumber, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Array[String]) }
      attr_accessor :capabilities

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(Zavudev::OwnedPhoneNumberPricing) }
      attr_reader :pricing

      sig { params(pricing: Zavudev::OwnedPhoneNumberPricing::OrHash).void }
      attr_writer :pricing

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
      sig { returns(Zavudev::OwnedPhoneNumber::RegulatoryStatus::TaggedSymbol) }
      attr_accessor :regulatory_status

      # Billing state of an owned number, separate from `regulatoryStatus`. `pending` is
      # legacy and is not written to numbers today. The SDKs carry `active`, `suspended`
      # and `pending` only; `releasing` and `released` are returned by the REST API
      # until their next release.
      sig { returns(Zavudev::PhoneNumberStatus::TaggedSymbol) }
      attr_accessor :status

      # Optional custom name for the phone number.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(Time)) }
      attr_reader :next_renewal_date

      sig { params(next_renewal_date: Time).void }
      attr_writer :next_renewal_date

      # Sender ID if the phone number is assigned to a sender.
      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          id: String,
          capabilities: T::Array[String],
          created_at: Time,
          phone_number: String,
          pricing: Zavudev::OwnedPhoneNumberPricing::OrHash,
          regulatory_status:
            Zavudev::OwnedPhoneNumber::RegulatoryStatus::OrSymbol,
          status: Zavudev::PhoneNumberStatus::OrSymbol,
          name: String,
          next_renewal_date: Time,
          sender_id: String,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        capabilities:,
        created_at:,
        phone_number:,
        pricing:,
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
        regulatory_status:,
        # Billing state of an owned number, separate from `regulatoryStatus`. `pending` is
        # legacy and is not written to numbers today. The SDKs carry `active`, `suspended`
        # and `pending` only; `releasing` and `released` are returned by the REST API
        # until their next release.
        status:,
        # Optional custom name for the phone number.
        name: nil,
        next_renewal_date: nil,
        # Sender ID if the phone number is assigned to a sender.
        sender_id: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            capabilities: T::Array[String],
            created_at: Time,
            phone_number: String,
            pricing: Zavudev::OwnedPhoneNumberPricing,
            regulatory_status:
              Zavudev::OwnedPhoneNumber::RegulatoryStatus::TaggedSymbol,
            status: Zavudev::PhoneNumberStatus::TaggedSymbol,
            name: String,
            next_renewal_date: Time,
            sender_id: String,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

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
      module RegulatoryStatus
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::OwnedPhoneNumber::RegulatoryStatus)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        APPROVED =
          T.let(
            :approved,
            Zavudev::OwnedPhoneNumber::RegulatoryStatus::TaggedSymbol
          )
        PENDING_REVIEW =
          T.let(
            :pending_review,
            Zavudev::OwnedPhoneNumber::RegulatoryStatus::TaggedSymbol
          )
        REJECTED =
          T.let(
            :rejected,
            Zavudev::OwnedPhoneNumber::RegulatoryStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::OwnedPhoneNumber::RegulatoryStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
