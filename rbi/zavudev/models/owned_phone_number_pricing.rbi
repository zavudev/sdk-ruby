# typed: strong

module Zavudev
  module Models
    class OwnedPhoneNumberPricing < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::OwnedPhoneNumberPricing, Zavudev::Internal::AnyHash)
        end

      # Whether this is a free number.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_free_number

      sig { params(is_free_number: T::Boolean).void }
      attr_writer :is_free_number

      # Monthly cost in cents.
      sig { returns(T.nilable(Float)) }
      attr_reader :monthly_cost

      sig { params(monthly_cost: Float).void }
      attr_writer :monthly_cost

      # Monthly price in USD.
      sig { returns(T.nilable(Float)) }
      attr_reader :monthly_price

      sig { params(monthly_price: Float).void }
      attr_writer :monthly_price

      # One-time purchase cost in cents.
      sig { returns(T.nilable(Float)) }
      attr_reader :upfront_cost

      sig { params(upfront_cost: Float).void }
      attr_writer :upfront_cost

      sig do
        params(
          is_free_number: T::Boolean,
          monthly_cost: Float,
          monthly_price: Float,
          upfront_cost: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether this is a free number.
        is_free_number: nil,
        # Monthly cost in cents.
        monthly_cost: nil,
        # Monthly price in USD.
        monthly_price: nil,
        # One-time purchase cost in cents.
        upfront_cost: nil
      )
      end

      sig do
        override.returns(
          {
            is_free_number: T::Boolean,
            monthly_cost: Float,
            monthly_price: Float,
            upfront_cost: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
