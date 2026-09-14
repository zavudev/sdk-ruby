# typed: strong

module Zavudev
  module Models
    class FunctionRollbackDeploymentParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::FunctionRollbackDeploymentParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :function_id

      # ID of the deployment to roll back to.
      sig { returns(String) }
      attr_accessor :deployment_id

      sig do
        params(
          function_id: String,
          deployment_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        function_id:,
        # ID of the deployment to roll back to.
        deployment_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            function_id: String,
            deployment_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
