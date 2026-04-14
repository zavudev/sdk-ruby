# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#list_use_cases
      class BrandListUseCasesParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
