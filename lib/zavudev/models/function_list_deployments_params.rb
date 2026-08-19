# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#list_deployments
    class FunctionListDeploymentsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute function_id
      #
      #   @return [String]
      required :function_id, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(function_id:, limit: nil, request_options: {})
      #   @param function_id [String]
      #   @param limit [Integer]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
