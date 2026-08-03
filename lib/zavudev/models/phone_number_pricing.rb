# frozen_string_literal: true

module Zavudev
  module Models
    class PhoneNumberPricing < Zavudev::Internal::Type::BaseModel
      # @!attribute is_free_eligible
      #   Whether this number qualifies as the plan-included first US number on paid
      #   plans.
      #
      #   @return [Boolean, nil]
      optional :is_free_eligible, Zavudev::Internal::Type::Boolean, api_name: :isFreeEligible

      # @!attribute monthly_price
      #   Monthly price in USD.
      #
      #   @return [Float, nil]
      optional :monthly_price, Float, api_name: :monthlyPrice

      # @!attribute upfront_price
      #   One-time purchase price in USD.
      #
      #   @return [Float, nil]
      optional :upfront_price, Float, api_name: :upfrontPrice

      # @!method initialize(is_free_eligible: nil, monthly_price: nil, upfront_price: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::PhoneNumberPricing} for more details.
      #
      #   @param is_free_eligible [Boolean] Whether this number qualifies as the plan-included first US number on paid plans
      #
      #   @param monthly_price [Float] Monthly price in USD.
      #
      #   @param upfront_price [Float] One-time purchase price in USD.
    end
  end
end
