# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#get_deployment
    class FunctionGetDeploymentParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute deployment_id
      #
      #   @return [String]
      required :deployment_id, String

      # @!method initialize(deployment_id:, request_options: {})
      #   @param deployment_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
