# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Usage#retrieve
    class UsageRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
