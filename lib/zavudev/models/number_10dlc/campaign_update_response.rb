# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Campaigns#update
      class CampaignUpdateResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute campaign
        #
        #   @return [Zavudev::Models::Number10dlc::TenDlcCampaign]
        required :campaign, -> { Zavudev::Number10dlc::TenDlcCampaign }

        # @!method initialize(campaign:)
        #   @param campaign [Zavudev::Models::Number10dlc::TenDlcCampaign]
      end
    end
  end
end
