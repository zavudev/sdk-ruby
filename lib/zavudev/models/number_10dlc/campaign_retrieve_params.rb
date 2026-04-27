# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Campaigns#retrieve
      class CampaignRetrieveParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute campaign_id
        #
        #   @return [String]
        required :campaign_id, String

        # @!method initialize(campaign_id:, request_options: {})
        #   @param campaign_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
