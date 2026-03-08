# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#purchase
    class PhoneNumberPurchaseParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute phone_number
      #   Phone number in E.164 format.
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute name
      #   Optional custom name for the phone number.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(phone_number:, name: nil, request_options: {})
      #   @param phone_number [String] Phone number in E.164 format.
      #
      #   @param name [String] Optional custom name for the phone number.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
