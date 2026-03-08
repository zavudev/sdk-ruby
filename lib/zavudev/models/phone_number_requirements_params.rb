# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#requirements
    class PhoneNumberRequirementsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute country_code
      #   Two-letter ISO country code.
      #
      #   @return [String]
      required :country_code, String

      # @!attribute type
      #   Type of phone number (local, mobile, tollFree).
      #
      #   @return [Symbol, Zavudev::Models::PhoneNumberType, nil]
      optional :type, enum: -> { Zavudev::PhoneNumberType }

      # @!method initialize(country_code:, type: nil, request_options: {})
      #   @param country_code [String] Two-letter ISO country code.
      #
      #   @param type [Symbol, Zavudev::Models::PhoneNumberType] Type of phone number (local, mobile, tollFree).
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
