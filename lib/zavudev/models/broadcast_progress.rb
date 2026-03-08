# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#progress
    class BroadcastProgress < Zavudev::Internal::Type::BaseModel
      # @!attribute broadcast_id
      #
      #   @return [String]
      required :broadcast_id, String, api_name: :broadcastId

      # @!attribute delivered
      #   Successfully delivered.
      #
      #   @return [Integer]
      required :delivered, Integer

      # @!attribute failed
      #   Failed to deliver.
      #
      #   @return [Integer]
      required :failed, Integer

      # @!attribute pending
      #   Not yet queued for sending.
      #
      #   @return [Integer]
      required :pending, Integer

      # @!attribute percent_complete
      #   Percentage complete (0-100).
      #
      #   @return [Float]
      required :percent_complete, Float, api_name: :percentComplete

      # @!attribute sending
      #   Currently being sent.
      #
      #   @return [Integer]
      required :sending, Integer

      # @!attribute skipped
      #   Skipped (broadcast cancelled).
      #
      #   @return [Integer]
      required :skipped, Integer

      # @!attribute status
      #   Current status of the broadcast.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastStatus]
      required :status, enum: -> { Zavudev::BroadcastStatus }

      # @!attribute total
      #   Total contacts in broadcast.
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute actual_cost
      #   Actual cost so far in USD.
      #
      #   @return [Float, nil]
      optional :actual_cost, Float, api_name: :actualCost, nil?: true

      # @!attribute estimated_completion_at
      #
      #   @return [Time, nil]
      optional :estimated_completion_at, Time, api_name: :estimatedCompletionAt

      # @!attribute estimated_cost
      #   Estimated total cost in USD.
      #
      #   @return [Float, nil]
      optional :estimated_cost, Float, api_name: :estimatedCost, nil?: true

      # @!attribute reserved_amount
      #   Amount reserved from balance in USD.
      #
      #   @return [Float, nil]
      optional :reserved_amount, Float, api_name: :reservedAmount, nil?: true

      # @!attribute started_at
      #
      #   @return [Time, nil]
      optional :started_at, Time, api_name: :startedAt

      # @!method initialize(broadcast_id:, delivered:, failed:, pending:, percent_complete:, sending:, skipped:, status:, total:, actual_cost: nil, estimated_completion_at: nil, estimated_cost: nil, reserved_amount: nil, started_at: nil)
      #   @param broadcast_id [String]
      #
      #   @param delivered [Integer] Successfully delivered.
      #
      #   @param failed [Integer] Failed to deliver.
      #
      #   @param pending [Integer] Not yet queued for sending.
      #
      #   @param percent_complete [Float] Percentage complete (0-100).
      #
      #   @param sending [Integer] Currently being sent.
      #
      #   @param skipped [Integer] Skipped (broadcast cancelled).
      #
      #   @param status [Symbol, Zavudev::Models::BroadcastStatus] Current status of the broadcast.
      #
      #   @param total [Integer] Total contacts in broadcast.
      #
      #   @param actual_cost [Float, nil] Actual cost so far in USD.
      #
      #   @param estimated_completion_at [Time]
      #
      #   @param estimated_cost [Float, nil] Estimated total cost in USD.
      #
      #   @param reserved_amount [Float, nil] Amount reserved from balance in USD.
      #
      #   @param started_at [Time]
    end
  end
end
