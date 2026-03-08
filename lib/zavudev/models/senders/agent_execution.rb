# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      class AgentExecution < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String, api_name: :agentId

        # @!attribute cost
        #   Cost in USD.
        #
        #   @return [Float]
        required :cost, Float

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute input_tokens
        #
        #   @return [Integer]
        required :input_tokens, Integer, api_name: :inputTokens

        # @!attribute latency_ms
        #
        #   @return [Integer]
        required :latency_ms, Integer, api_name: :latencyMs

        # @!attribute output_tokens
        #
        #   @return [Integer]
        required :output_tokens, Integer, api_name: :outputTokens

        # @!attribute status
        #   Status of an agent execution.
        #
        #   @return [Symbol, Zavudev::Models::Senders::AgentExecutionStatus]
        required :status, enum: -> { Zavudev::Senders::AgentExecutionStatus }

        # @!attribute error_message
        #
        #   @return [String, nil]
        optional :error_message, String, api_name: :errorMessage, nil?: true

        # @!attribute inbound_message_id
        #
        #   @return [String, nil]
        optional :inbound_message_id, String, api_name: :inboundMessageId

        # @!attribute response_message_id
        #
        #   @return [String, nil]
        optional :response_message_id, String, api_name: :responseMessageId, nil?: true

        # @!attribute response_text
        #
        #   @return [String, nil]
        optional :response_text, String, api_name: :responseText, nil?: true

        # @!method initialize(id:, agent_id:, cost:, created_at:, input_tokens:, latency_ms:, output_tokens:, status:, error_message: nil, inbound_message_id: nil, response_message_id: nil, response_text: nil)
        #   @param id [String]
        #
        #   @param agent_id [String]
        #
        #   @param cost [Float] Cost in USD.
        #
        #   @param created_at [Time]
        #
        #   @param input_tokens [Integer]
        #
        #   @param latency_ms [Integer]
        #
        #   @param output_tokens [Integer]
        #
        #   @param status [Symbol, Zavudev::Models::Senders::AgentExecutionStatus] Status of an agent execution.
        #
        #   @param error_message [String, nil]
        #
        #   @param inbound_message_id [String]
        #
        #   @param response_message_id [String, nil]
        #
        #   @param response_text [String, nil]
      end
    end
  end
end
