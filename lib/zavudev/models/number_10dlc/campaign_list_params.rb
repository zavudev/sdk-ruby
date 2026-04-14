# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Campaigns#list
      class CampaignListParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute brand_id
        #   Filter campaigns by brand ID.
        #
        #   @return [String, nil]
        optional :brand_id, String

        # @!attribute cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(brand_id: nil, cursor: nil, limit: nil, request_options: {})
        #   @param brand_id [String] Filter campaigns by brand ID.
        #
        #   @param cursor [String]
        #
        #   @param limit [Integer]
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
