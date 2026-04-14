# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        # @see Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers#unassign
        class PhoneNumberUnassignParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute campaign_id
          #
          #   @return [String]
          required :campaign_id, String

          # @!attribute assignment_id
          #
          #   @return [String]
          required :assignment_id, String

          # @!method initialize(campaign_id:, assignment_id:, request_options: {})
          #   @param campaign_id [String]
          #   @param assignment_id [String]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
