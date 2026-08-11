# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#deploy
    class FunctionDeployResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute deployment
      #
      #   @return [Zavudev::Models::FunctionDeployResponse::Deployment]
      required :deployment, -> { Zavudev::Models::FunctionDeployResponse::Deployment }

      # @!method initialize(deployment:)
      #   @param deployment [Zavudev::Models::FunctionDeployResponse::Deployment]

      # @see Zavudev::Models::FunctionDeployResponse#deployment
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
        #   @return [Symbol, Zavudev::Models::FunctionDeployResponse::Deployment::Status]
        required :status, enum: -> { Zavudev::Models::FunctionDeployResponse::Deployment::Status }

        # @!attribute version
        #   Monotonically increasing deployment version, starting at 1.
        #
        #   @return [Integer]
        required :version, Integer

        # @!attribute build_logs
        #   What the build printed: dependency installation, the bundler's output, and the
        #   compiler's message when it failed. Returned when fetching a single deployment,
        #   omitted from the list. Read this first when a deploy fails — `errorMessage` is
        #   often the outer wrapper's summary, and the line that names the broken import or
        #   the syntax error is here.
        #
        #   @return [String, nil]
        optional :build_logs, String, api_name: :buildLogs, nil?: true

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

        # @!method initialize(id:, created_at:, function_id:, status:, version:, build_logs: nil, bundle_bytes: nil, deployed_at: nil, error_message: nil, source_code_bytes: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::FunctionDeployResponse::Deployment} for more details.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param function_id [String]
        #
        #   @param status [Symbol, Zavudev::Models::FunctionDeployResponse::Deployment::Status] Stage of a function deployment.
        #
        #   @param version [Integer] Monotonically increasing deployment version, starting at 1.
        #
        #   @param build_logs [String, nil] What the build printed: dependency installation, the bundler's output, and the c
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
        # @see Zavudev::Models::FunctionDeployResponse::Deployment#status
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
