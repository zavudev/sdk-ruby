# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#delete
      class BrandDeleteParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute brand_id
        #
        #   @return [String]
        required :brand_id, String

        # @!method initialize(brand_id:, request_options: {})
        #   @param brand_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
