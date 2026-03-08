# typed: strong

module Zavudev
  module Models
    class PhoneNumberPricing < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::PhoneNumberPricing, Zavudev::Internal::AnyHash)
        end

      # Whether this number qualifies for the free first US number offer.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_free_eligible

      sig { params(is_free_eligible: T::Boolean).void }
      attr_writer :is_free_eligible

      # Monthly price in USD.
      sig { returns(T.nilable(Float)) }
      attr_reader :monthly_price

      sig { params(monthly_price: Float).void }
      attr_writer :monthly_price

      # One-time purchase price in USD.
      sig { returns(T.nilable(Float)) }
      attr_reader :upfront_price

      sig { params(upfront_price: Float).void }
      attr_writer :upfront_price

      sig do
        params(
          is_free_eligible: T::Boolean,
          monthly_price: Float,
          upfront_price: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether this number qualifies for the free first US number offer.
        is_free_eligible: nil,
        # Monthly price in USD.
        monthly_price: nil,
        # One-time purchase price in USD.
        upfront_price: nil
      )
      end

      sig do
        override.returns(
          {
            is_free_eligible: T::Boolean,
            monthly_price: Float,
            upfront_price: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
