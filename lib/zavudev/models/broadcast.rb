# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#list
    class Broadcast < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute channel
      #   Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastChannel]
      required :channel, enum: -> { Zavudev::BroadcastChannel }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute message_type
      #   Type of message for broadcast.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastMessageType]
      required :message_type, enum: -> { Zavudev::BroadcastMessageType }, api_name: :messageType

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute status
      #   Current status of the broadcast.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastStatus]
      required :status, enum: -> { Zavudev::BroadcastStatus }

      # @!attribute total_contacts
      #   Total number of contacts in the broadcast.
      #
      #   @return [Integer]
      required :total_contacts, Integer, api_name: :totalContacts

      # @!attribute actual_cost
      #   Actual cost so far in USD.
      #
      #   @return [Float, nil]
      optional :actual_cost, Float, api_name: :actualCost, nil?: true

      # @!attribute completed_at
      #
      #   @return [Time, nil]
      optional :completed_at, Time, api_name: :completedAt

      # @!attribute content
      #   Content for non-text broadcast message types.
      #
      #   @return [Zavudev::Models::BroadcastContent, nil]
      optional :content, -> { Zavudev::BroadcastContent }

      # @!attribute delivered_count
      #
      #   @return [Integer, nil]
      optional :delivered_count, Integer, api_name: :deliveredCount

      # @!attribute email_subject
      #
      #   @return [String, nil]
      optional :email_subject, String, api_name: :emailSubject

      # @!attribute estimated_cost
      #   Estimated total cost in USD.
      #
      #   @return [Float, nil]
      optional :estimated_cost, Float, api_name: :estimatedCost, nil?: true

      # @!attribute failed_count
      #
      #   @return [Integer, nil]
      optional :failed_count, Integer, api_name: :failedCount

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute pending_count
      #
      #   @return [Integer, nil]
      optional :pending_count, Integer, api_name: :pendingCount

      # @!attribute reserved_amount
      #   Amount reserved from balance in USD.
      #
      #   @return [Float, nil]
      optional :reserved_amount, Float, api_name: :reservedAmount, nil?: true

      # @!attribute review_attempts
      #   Number of review attempts (max 3).
      #
      #   @return [Integer, nil]
      optional :review_attempts, Integer, api_name: :reviewAttempts, nil?: true

      # @!attribute review_result
      #   AI content review result.
      #
      #   @return [Zavudev::Models::Broadcast::ReviewResult, nil]
      optional :review_result, -> { Zavudev::Broadcast::ReviewResult }, api_name: :reviewResult, nil?: true

      # @!attribute scheduled_at
      #
      #   @return [Time, nil]
      optional :scheduled_at, Time, api_name: :scheduledAt

      # @!attribute sender_id
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId

      # @!attribute sending_count
      #
      #   @return [Integer, nil]
      optional :sending_count, Integer, api_name: :sendingCount

      # @!attribute started_at
      #
      #   @return [Time, nil]
      optional :started_at, Time, api_name: :startedAt

      # @!attribute text
      #
      #   @return [String, nil]
      optional :text, String

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, channel:, created_at:, message_type:, name:, status:, total_contacts:, actual_cost: nil, completed_at: nil, content: nil, delivered_count: nil, email_subject: nil, estimated_cost: nil, failed_count: nil, metadata: nil, pending_count: nil, reserved_amount: nil, review_attempts: nil, review_result: nil, scheduled_at: nil, sender_id: nil, sending_count: nil, started_at: nil, text: nil, updated_at: nil)
      #   @param id [String]
      #
      #   @param channel [Symbol, Zavudev::Models::BroadcastChannel] Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      #
      #   @param created_at [Time]
      #
      #   @param message_type [Symbol, Zavudev::Models::BroadcastMessageType] Type of message for broadcast.
      #
      #   @param name [String]
      #
      #   @param status [Symbol, Zavudev::Models::BroadcastStatus] Current status of the broadcast.
      #
      #   @param total_contacts [Integer] Total number of contacts in the broadcast.
      #
      #   @param actual_cost [Float, nil] Actual cost so far in USD.
      #
      #   @param completed_at [Time]
      #
      #   @param content [Zavudev::Models::BroadcastContent] Content for non-text broadcast message types.
      #
      #   @param delivered_count [Integer]
      #
      #   @param email_subject [String]
      #
      #   @param estimated_cost [Float, nil] Estimated total cost in USD.
      #
      #   @param failed_count [Integer]
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param pending_count [Integer]
      #
      #   @param reserved_amount [Float, nil] Amount reserved from balance in USD.
      #
      #   @param review_attempts [Integer, nil] Number of review attempts (max 3).
      #
      #   @param review_result [Zavudev::Models::Broadcast::ReviewResult, nil] AI content review result.
      #
      #   @param scheduled_at [Time]
      #
      #   @param sender_id [String]
      #
      #   @param sending_count [Integer]
      #
      #   @param started_at [Time]
      #
      #   @param text [String]
      #
      #   @param updated_at [Time]

      # @see Zavudev::Models::Broadcast#review_result
      class ReviewResult < Zavudev::Internal::Type::BaseModel
        # @!attribute categories
        #   Policy categories violated, if any.
        #
        #   @return [Array<String>, nil]
        optional :categories, Zavudev::Internal::Type::ArrayOf[String]

        # @!attribute flagged_content
        #   Problematic text fragments, if any.
        #
        #   @return [Array<String>, nil]
        optional :flagged_content,
                 Zavudev::Internal::Type::ArrayOf[String],
                 api_name: :flaggedContent,
                 nil?: true

        # @!attribute reasoning
        #   Explanation of the review decision.
        #
        #   @return [String, nil]
        optional :reasoning, String

        # @!attribute reviewed_at
        #
        #   @return [Time, nil]
        optional :reviewed_at, Time, api_name: :reviewedAt

        # @!attribute score
        #   Content safety score from 0.0 to 1.0, where 1.0 is completely safe.
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!method initialize(categories: nil, flagged_content: nil, reasoning: nil, reviewed_at: nil, score: nil)
        #   AI content review result.
        #
        #   @param categories [Array<String>] Policy categories violated, if any.
        #
        #   @param flagged_content [Array<String>, nil] Problematic text fragments, if any.
        #
        #   @param reasoning [String] Explanation of the review decision.
        #
        #   @param reviewed_at [Time]
        #
        #   @param score [Float] Content safety score from 0.0 to 1.0, where 1.0 is completely safe.
      end
    end
  end
end
