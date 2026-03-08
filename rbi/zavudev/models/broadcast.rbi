# typed: strong

module Zavudev
  module Models
    class Broadcast < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Broadcast, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      sig { returns(Zavudev::BroadcastChannel::TaggedSymbol) }
      attr_accessor :channel

      sig { returns(Time) }
      attr_accessor :created_at

      # Type of message for broadcast.
      sig { returns(Zavudev::BroadcastMessageType::TaggedSymbol) }
      attr_accessor :message_type

      sig { returns(String) }
      attr_accessor :name

      # Current status of the broadcast.
      sig { returns(Zavudev::BroadcastStatus::TaggedSymbol) }
      attr_accessor :status

      # Total number of contacts in the broadcast.
      sig { returns(Integer) }
      attr_accessor :total_contacts

      # Actual cost so far in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :actual_cost

      sig { returns(T.nilable(Time)) }
      attr_reader :completed_at

      sig { params(completed_at: Time).void }
      attr_writer :completed_at

      # Content for non-text broadcast message types.
      sig { returns(T.nilable(Zavudev::BroadcastContent)) }
      attr_reader :content

      sig { params(content: Zavudev::BroadcastContent::OrHash).void }
      attr_writer :content

      sig { returns(T.nilable(Integer)) }
      attr_reader :delivered_count

      sig { params(delivered_count: Integer).void }
      attr_writer :delivered_count

      sig { returns(T.nilable(String)) }
      attr_reader :email_subject

      sig { params(email_subject: String).void }
      attr_writer :email_subject

      # Estimated total cost in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :estimated_cost

      sig { returns(T.nilable(Integer)) }
      attr_reader :failed_count

      sig { params(failed_count: Integer).void }
      attr_writer :failed_count

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig { returns(T.nilable(Integer)) }
      attr_reader :pending_count

      sig { params(pending_count: Integer).void }
      attr_writer :pending_count

      # Amount reserved from balance in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :reserved_amount

      # Number of review attempts (max 3).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :review_attempts

      # AI content review result.
      sig { returns(T.nilable(Zavudev::Broadcast::ReviewResult)) }
      attr_reader :review_result

      sig do
        params(
          review_result: T.nilable(Zavudev::Broadcast::ReviewResult::OrHash)
        ).void
      end
      attr_writer :review_result

      sig { returns(T.nilable(Time)) }
      attr_reader :scheduled_at

      sig { params(scheduled_at: Time).void }
      attr_writer :scheduled_at

      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      sig { returns(T.nilable(Integer)) }
      attr_reader :sending_count

      sig { params(sending_count: Integer).void }
      attr_writer :sending_count

      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          id: String,
          channel: Zavudev::BroadcastChannel::OrSymbol,
          created_at: Time,
          message_type: Zavudev::BroadcastMessageType::OrSymbol,
          name: String,
          status: Zavudev::BroadcastStatus::OrSymbol,
          total_contacts: Integer,
          actual_cost: T.nilable(Float),
          completed_at: Time,
          content: Zavudev::BroadcastContent::OrHash,
          delivered_count: Integer,
          email_subject: String,
          estimated_cost: T.nilable(Float),
          failed_count: Integer,
          metadata: T::Hash[Symbol, String],
          pending_count: Integer,
          reserved_amount: T.nilable(Float),
          review_attempts: T.nilable(Integer),
          review_result: T.nilable(Zavudev::Broadcast::ReviewResult::OrHash),
          scheduled_at: Time,
          sender_id: String,
          sending_count: Integer,
          started_at: Time,
          text: String,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
        channel:,
        created_at:,
        # Type of message for broadcast.
        message_type:,
        name:,
        # Current status of the broadcast.
        status:,
        # Total number of contacts in the broadcast.
        total_contacts:,
        # Actual cost so far in USD.
        actual_cost: nil,
        completed_at: nil,
        # Content for non-text broadcast message types.
        content: nil,
        delivered_count: nil,
        email_subject: nil,
        # Estimated total cost in USD.
        estimated_cost: nil,
        failed_count: nil,
        metadata: nil,
        pending_count: nil,
        # Amount reserved from balance in USD.
        reserved_amount: nil,
        # Number of review attempts (max 3).
        review_attempts: nil,
        # AI content review result.
        review_result: nil,
        scheduled_at: nil,
        sender_id: nil,
        sending_count: nil,
        started_at: nil,
        text: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channel: Zavudev::BroadcastChannel::TaggedSymbol,
            created_at: Time,
            message_type: Zavudev::BroadcastMessageType::TaggedSymbol,
            name: String,
            status: Zavudev::BroadcastStatus::TaggedSymbol,
            total_contacts: Integer,
            actual_cost: T.nilable(Float),
            completed_at: Time,
            content: Zavudev::BroadcastContent,
            delivered_count: Integer,
            email_subject: String,
            estimated_cost: T.nilable(Float),
            failed_count: Integer,
            metadata: T::Hash[Symbol, String],
            pending_count: Integer,
            reserved_amount: T.nilable(Float),
            review_attempts: T.nilable(Integer),
            review_result: T.nilable(Zavudev::Broadcast::ReviewResult),
            scheduled_at: Time,
            sender_id: String,
            sending_count: Integer,
            started_at: Time,
            text: String,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      class ReviewResult < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Broadcast::ReviewResult, Zavudev::Internal::AnyHash)
          end

        # Policy categories violated, if any.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :categories

        sig { params(categories: T::Array[String]).void }
        attr_writer :categories

        # Problematic text fragments, if any.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :flagged_content

        # Explanation of the review decision.
        sig { returns(T.nilable(String)) }
        attr_reader :reasoning

        sig { params(reasoning: String).void }
        attr_writer :reasoning

        sig { returns(T.nilable(Time)) }
        attr_reader :reviewed_at

        sig { params(reviewed_at: Time).void }
        attr_writer :reviewed_at

        # Content safety score from 0.0 to 1.0, where 1.0 is completely safe.
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        # AI content review result.
        sig do
          params(
            categories: T::Array[String],
            flagged_content: T.nilable(T::Array[String]),
            reasoning: String,
            reviewed_at: Time,
            score: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Policy categories violated, if any.
          categories: nil,
          # Problematic text fragments, if any.
          flagged_content: nil,
          # Explanation of the review decision.
          reasoning: nil,
          reviewed_at: nil,
          # Content safety score from 0.0 to 1.0, where 1.0 is completely safe.
          score: nil
        )
        end

        sig do
          override.returns(
            {
              categories: T::Array[String],
              flagged_content: T.nilable(T::Array[String]),
              reasoning: String,
              reviewed_at: Time,
              score: Float
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
