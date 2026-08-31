# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#rollback_deployment
    class FunctionRollbackDeploymentParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute function_id
      #
      #   @return [String]
      required :function_id, String

      # @!attribute deployment_id
      #   ID of the deployment to roll back to.
      #
      #   @return [String]
      required :deployment_id, String, api_name: :deploymentId

      # @!method initialize(function_id:, deployment_id:, request_options: {})
      #   @param function_id [String]
      #
      #   @param deployment_id [String] ID of the deployment to roll back to.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
