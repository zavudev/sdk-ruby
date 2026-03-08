# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Introspect#validate_phone
    class IntrospectValidatePhoneParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!method initialize(phone_number:, request_options: {})
      #   @param phone_number [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
