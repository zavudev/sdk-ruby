# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        # @see Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers#assign
        class PhoneNumberAssignParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute campaign_id
          #
          #   @return [String]
          required :campaign_id, String

          # @!attribute phone_number_id
          #   ID of the phone number to assign.
          #
          #   @return [String]
          required :phone_number_id, String, api_name: :phoneNumberId

          # @!method initialize(campaign_id:, phone_number_id:, request_options: {})
          #   @param campaign_id [String]
          #
          #   @param phone_number_id [String] ID of the phone number to assign.
          #
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
