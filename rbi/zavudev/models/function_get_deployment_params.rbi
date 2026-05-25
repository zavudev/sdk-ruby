# typed: strong

module Zavudev
  module Models
    class FunctionGetDeploymentParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::FunctionGetDeploymentParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :deployment_id

      sig do
        params(
          deployment_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(deployment_id:, request_options: {})
      end

      sig do
        override.returns(
          { deployment_id: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
