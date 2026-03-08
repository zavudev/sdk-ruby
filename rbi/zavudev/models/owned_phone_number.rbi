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
    end
  end
end
