# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#delete
    class FunctionDeleteParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute function_id
      #
      #   @return [String]
      required :function_id, String

      # @!method initialize(function_id:, request_options: {})
      #   @param function_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
