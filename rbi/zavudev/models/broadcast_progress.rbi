# typed: strong

module Zavudev
  module Models
    class BroadcastProgress < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastProgress, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :broadcast_id

      # Successfully delivered.
      sig { returns(Integer) }
      attr_accessor :delivered

      # Failed to deliver.
      sig { returns(Integer) }
      attr_accessor :failed

      # Not yet queued for sending.
      sig { returns(Integer) }
      attr_accessor :pending

      # Percentage complete (0-100).
      sig { returns(Float) }
      attr_accessor :percent_complete

      # Currently being sent.
      sig { returns(Integer) }
      attr_accessor :sending

      # Skipped (broadcast cancelled).
      sig { returns(Integer) }
      attr_accessor :skipped

      # Current status of the broadcast.
      sig { returns(Zavudev::BroadcastStatus::TaggedSymbol) }
      attr_accessor :status

      # Total contacts in broadcast.
      sig { returns(Integer) }
      attr_accessor :total

      # Actual cost so far in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :actual_cost

      sig { returns(T.nilable(Time)) }
      attr_reader :estimated_completion_at

      sig { params(estimated_completion_at: Time).void }
      attr_writer :estimated_completion_at

      # Estimated total cost in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :estimated_cost

      # Amount reserved from balance in USD.
      sig { returns(T.nilable(Float)) }
      attr_accessor :reserved_amount

      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      sig do
        params(
          broadcast_id: String,
          delivered: Integer,
          failed: Integer,
          pending: Integer,
          percent_complete: Float,
          sending: Integer,
          skipped: Integer,
          status: Zavudev::BroadcastStatus::OrSymbol,
          total: Integer,
          actual_cost: T.nilable(Float),
          estimated_completion_at: Time,
          estimated_cost: T.nilable(Float),
          reserved_amount: T.nilable(Float),
          started_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        broadcast_id:,
        # Successfully delivered.
        delivered:,
        # Failed to deliver.
        failed:,
        # Not yet queued for sending.
        pending:,
        # Percentage complete (0-100).
        percent_complete:,
        # Currently being sent.
        sending:,
        # Skipped (broadcast cancelled).
        skipped:,
        # Current status of the broadcast.
        status:,
        # Total contacts in broadcast.
        total:,
        # Actual cost so far in USD.
        actual_cost: nil,
        estimated_completion_at: nil,
        # Estimated total cost in USD.
        estimated_cost: nil,
        # Amount reserved from balance in USD.
        reserved_amount: nil,
        started_at: nil
      )
      end

      sig do
        override.returns(
          {
            broadcast_id: String,
            delivered: Integer,
            failed: Integer,
            pending: Integer,
            percent_complete: Float,
            sending: Integer,
            skipped: Integer,
            status: Zavudev::BroadcastStatus::TaggedSymbol,
            total: Integer,
            actual_cost: T.nilable(Float),
            estimated_completion_at: Time,
            estimated_cost: T.nilable(Float),
            reserved_amount: T.nilable(Float),
            started_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
