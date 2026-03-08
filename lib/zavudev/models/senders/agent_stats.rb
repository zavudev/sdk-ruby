# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::Agent#stats
      class AgentStats < Zavudev::Internal::Type::BaseModel
        # @!attribute error_count
        #
        #   @return [Integer]
        required :error_count, Integer, api_name: :errorCount

        # @!attribute success_count
        #
        #   @return [Integer]
        required :success_count, Integer, api_name: :successCount

        # @!attribute total_cost
        #   Total cost in USD.
        #
        #   @return [Float]
        required :total_cost, Float, api_name: :totalCost

        # @!attribute total_invocations
        #
        #   @return [Integer]
        required :total_invocations, Integer, api_name: :totalInvocations

        # @!attribute total_tokens_used
        #
        #   @return [Integer]
        required :total_tokens_used, Integer, api_name: :totalTokensUsed

        # @!attribute avg_latency_ms
        #
        #   @return [Float, nil]
        optional :avg_latency_ms, Float, api_name: :avgLatencyMs, nil?: true

        # @!method initialize(error_count:, success_count:, total_cost:, total_invocations:, total_tokens_used:, avg_latency_ms: nil)
        #   @param error_count [Integer]
        #
        #   @param success_count [Integer]
        #
        #   @param total_cost [Float] Total cost in USD.
        #
        #   @param total_invocations [Integer]
        #
        #   @param total_tokens_used [Integer]
        #
        #   @param avg_latency_ms [Float, nil]
      end
    end
  end
end
