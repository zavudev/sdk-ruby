# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#test_
        class ToolTestResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute run
          #   One run of a tool triggered from the test endpoint. Recorded so a test is
          #   verifiable after the fact rather than only visible in the response.
          #
          #   @return [Zavudev::Models::Senders::Agent::ToolTestResponse::Run]
          required :run, -> { Zavudev::Models::Senders::Agent::ToolTestResponse::Run }

          # @!method initialize(run:)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Senders::Agent::ToolTestResponse} for more details.
          #
          #   @param run [Zavudev::Models::Senders::Agent::ToolTestResponse::Run] One run of a tool triggered from the test endpoint. Recorded so a test is verifi

          # @see Zavudev::Models::Senders::Agent::ToolTestResponse#run
          class Run < Zavudev::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #
            #   @return [Time]
            required :created_at, Time, api_name: :createdAt

            # @!attribute duration_ms
            #
            #   @return [Integer]
            required :duration_ms, Integer, api_name: :durationMs

            # @!attribute success
            #   Whether the tool returned without error. A tool that answered with a non-2xx
            #   status is a failed run, not an error of this endpoint.
            #
            #   @return [Boolean]
            required :success, Zavudev::Internal::Type::Boolean

            # @!attribute tool_id
            #
            #   @return [String]
            required :tool_id, String, api_name: :toolId

            # @!attribute error
            #   Why the run failed, when it did.
            #
            #   @return [String, nil]
            optional :error, String, nil?: true

            # @!attribute params
            #   The parameters the tool was called with.
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :params, Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown]

            # @!attribute response
            #   The tool's response body, truncated.
            #
            #   @return [String, nil]
            optional :response, String, nil?: true

            # @!attribute status_code
            #   HTTP status the tool's webhook returned. Absent for tools that do not go over
            #   HTTP.
            #
            #   @return [Integer, nil]
            optional :status_code, Integer, api_name: :statusCode, nil?: true

            # @!method initialize(id:, created_at:, duration_ms:, success:, tool_id:, error: nil, params: nil, response: nil, status_code: nil)
            #   Some parameter documentations has been truncated, see
            #   {Zavudev::Models::Senders::Agent::ToolTestResponse::Run} for more details.
            #
            #   One run of a tool triggered from the test endpoint. Recorded so a test is
            #   verifiable after the fact rather than only visible in the response.
            #
            #   @param id [String]
            #
            #   @param created_at [Time]
            #
            #   @param duration_ms [Integer]
            #
            #   @param success [Boolean] Whether the tool returned without error. A tool that answered with a non-2xx sta
            #
            #   @param tool_id [String]
            #
            #   @param error [String, nil] Why the run failed, when it did.
            #
            #   @param params [Hash{Symbol=>Object}] The parameters the tool was called with.
            #
            #   @param response [String, nil] The tool's response body, truncated.
            #
            #   @param status_code [Integer, nil] HTTP status the tool's webhook returned. Absent for tools that do not go over HT
          end
        end
      end
    end
  end
end
