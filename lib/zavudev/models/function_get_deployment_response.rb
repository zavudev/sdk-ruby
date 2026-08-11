# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#get_deployment
    class FunctionGetDeploymentResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute deployment
      #
      #   @return [Zavudev::Models::FunctionGetDeploymentResponse::Deployment]
      required :deployment, -> { Zavudev::Models::FunctionGetDeploymentResponse::Deployment }

      # @!method initialize(deployment:)
      #   @param deployment [Zavudev::Models::FunctionGetDeploymentResponse::Deployment]

      # @see Zavudev::Models::FunctionGetDeploymentResponse#deployment
      class Deployment < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute function_id
        #
        #   @return [String]
        required :function_id, String, api_name: :functionId

        # @!attribute status
        #   Stage of a function deployment.
        #
        #   @return [Symbol, Zavudev::Models::FunctionGetDeploymentResponse::Deployment::Status]
        required :status, enum: -> { Zavudev::Models::FunctionGetDeploymentResponse::Deployment::Status }

        # @!attribute version
        #   Monotonically increasing deployment version, starting at 1.
        #
        #   @return [Integer]
        required :version, Integer

        # @!attribute bundle_bytes
        #   Size of the built bundle in bytes. Null until the build finishes.
        #
        #   @return [Integer, nil]
        optional :bundle_bytes, Integer, api_name: :bundleBytes, nil?: true

        # @!attribute deployed_at
        #
        #   @return [Time, nil]
        optional :deployed_at, Time, api_name: :deployedAt, nil?: true

        # @!attribute error_message
        #   Failure reason when status is 'failed'.
        #
        #   @return [String, nil]
        optional :error_message, String, api_name: :errorMessage, nil?: true

        # @!attribute source_code_bytes
        #   Total size of the deployed source tree in bytes.
        #
        #   @return [Integer, nil]
        optional :source_code_bytes, Integer, api_name: :sourceCodeBytes, nil?: true

        # @!method initialize(id:, created_at:, function_id:, status:, version:, bundle_bytes: nil, deployed_at: nil, error_message: nil, source_code_bytes: nil)
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param function_id [String]
        #
        #   @param status [Symbol, Zavudev::Models::FunctionGetDeploymentResponse::Deployment::Status] Stage of a function deployment.
        #
        #   @param version [Integer] Monotonically increasing deployment version, starting at 1.
        #
        #   @param bundle_bytes [Integer, nil] Size of the built bundle in bytes. Null until the build finishes.
        #
        #   @param deployed_at [Time, nil]
        #
        #   @param error_message [String, nil] Failure reason when status is 'failed'.
        #
        #   @param source_code_bytes [Integer, nil] Total size of the deployed source tree in bytes.

        # Stage of a function deployment.
        #
        # @see Zavudev::Models::FunctionGetDeploymentResponse::Deployment#status
        module Status
          extend Zavudev::Internal::Type::Enum

          PENDING = :pending
          BUNDLING = :bundling
          UPLOADING = :uploading
          PUBLISHING = :publishing
          ACTIVE = :active
          FAILED = :failed
          SUPERSEDED = :superseded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
