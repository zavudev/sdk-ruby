# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#release
    class PhoneNumberReleaseParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute phone_number_id
      #
      #   @return [String]
      required :phone_number_id, String

      # @!method initialize(phone_number_id:, request_options: {})
      #   @param phone_number_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
