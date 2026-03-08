# typed: strong

module Zavudev
  module Models
    class AvailablePhoneNumber < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::AvailablePhoneNumber, Zavudev::Internal::AnyHash)
        end

      sig { returns(Zavudev::PhoneNumberCapabilities) }
      attr_reader :capabilities

      sig do
        params(capabilities: Zavudev::PhoneNumberCapabilities::OrHash).void
      end
      attr_writer :capabilities

      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(Zavudev::PhoneNumberPricing) }
      attr_reader :pricing

      sig { params(pricing: Zavudev::PhoneNumberPricing::OrHash).void }
      attr_writer :pricing

      sig { returns(T.nilable(String)) }
      attr_reader :friendly_name

      sig { params(friendly_name: String).void }
      attr_writer :friendly_name

      sig { returns(T.nilable(String)) }
      attr_reader :locality

      sig { params(locality: String).void }
      attr_writer :locality

      sig { returns(T.nilable(String)) }
      attr_reader :region

      sig { params(region: String).void }
      attr_writer :region

      sig do
        params(
          capabilities: Zavudev::PhoneNumberCapabilities::OrHash,
          phone_number: String,
          pricing: Zavudev::PhoneNumberPricing::OrHash,
          friendly_name: String,
          locality: String,
          region: String
        ).returns(T.attached_class)
      end
      def self.new(
        capabilities:,
        phone_number:,
        pricing:,
        friendly_name: nil,
        locality: nil,
        region: nil
      )
      end

      sig do
        override.returns(
          {
            capabilities: Zavudev::PhoneNumberCapabilities,
            phone_number: String,
            pricing: Zavudev::PhoneNumberPricing,
            friendly_name: String,
            locality: String,
            region: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
