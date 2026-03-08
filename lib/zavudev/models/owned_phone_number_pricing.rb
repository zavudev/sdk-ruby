# frozen_string_literal: true

module Zavudev
  module Models
    class OwnedPhoneNumberPricing < Zavudev::Internal::Type::BaseModel
      # @!attribute is_free_number
      #   Whether this is a free number.
      #
      #   @return [Boolean, nil]
      optional :is_free_number, Zavudev::Internal::Type::Boolean, api_name: :isFreeNumber

      # @!attribute monthly_cost
      #   Monthly cost in cents.
      #
      #   @return [Float, nil]
      optional :monthly_cost, Float, api_name: :monthlyCost

      # @!attribute monthly_price
      #   Monthly price in USD.
      #
      #   @return [Float, nil]
      optional :monthly_price, Float, api_name: :monthlyPrice

      # @!attribute upfront_cost
      #   One-time purchase cost in cents.
      #
      #   @return [Float, nil]
      optional :upfront_cost, Float, api_name: :upfrontCost

      # @!method initialize(is_free_number: nil, monthly_cost: nil, monthly_price: nil, upfront_cost: nil)
      #   @param is_free_number [Boolean] Whether this is a free number.
      #
      #   @param monthly_cost [Float] Monthly cost in cents.
      #
      #   @param monthly_price [Float] Monthly price in USD.
      #
      #   @param upfront_cost [Float] One-time purchase cost in cents.
    end
  end
end
