# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#list_deployments
    class FunctionListDeploymentsResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute deployments
      #
      #   @return [Array<Zavudev::Models::FunctionListDeploymentsResponse::Deployment>]
      required :deployments,
               -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::FunctionListDeploymentsResponse::Deployment] }

      # @!method initialize(deployments:)
      #   @param deployments [Array<Zavudev::Models::FunctionListDeploymentsResponse::Deployment>]

      class Deployment < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute bundle_size_bytes
        #
        #   @return [Integer, nil]
        optional :bundle_size_bytes, Integer, api_name: :bundleSizeBytes, nil?: true

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute deployed_at
        #
        #   @return [Time, nil]
        optional :deployed_at, Time, api_name: :deployedAt, nil?: true

        # @!attribute error_message
        #
        #   @return [String, nil]
        optional :error_message, String, api_name: :errorMessage, nil?: true

        # @!attribute is_active
        #
        #   @return [Boolean, nil]
        optional :is_active, Zavudev::Internal::Type::Boolean, api_name: :isActive

        # @!attribute status
        #   Stage of a function deployment.
        #
        #   @return [Symbol, Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status, nil]
        optional :status, enum: -> { Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status }

        # @!attribute version
        #
        #   @return [Integer, nil]
        optional :version, Integer

        # @!method initialize(id: nil, bundle_size_bytes: nil, created_at: nil, deployed_at: nil, error_message: nil, is_active: nil, status: nil, version: nil)
        #   @param id [String]
        #
        #   @param bundle_size_bytes [Integer, nil]
        #
        #   @param created_at [Time]
        #
        #   @param deployed_at [Time, nil]
        #
        #   @param error_message [String, nil]
        #
        #   @param is_active [Boolean]
        #
        #   @param status [Symbol, Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status] Stage of a function deployment.
        #
        #   @param version [Integer]

        # Stage of a function deployment.
        #
        # @see Zavudev::Models::FunctionListDeploymentsResponse::Deployment#status
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
