# typed: strong

module Zavudev
  module Models
    module Senders
      class AgentStats < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Senders::AgentStats, Zavudev::Internal::AnyHash)
          end

        sig { returns(Integer) }
        attr_accessor :error_count

        sig { returns(Integer) }
        attr_accessor :success_count

        # Total cost in USD.
        sig { returns(Float) }
        attr_accessor :total_cost

        sig { returns(Integer) }
        attr_accessor :total_invocations

        sig { returns(Integer) }
        attr_accessor :total_tokens_used

        sig { returns(T.nilable(Float)) }
        attr_accessor :avg_latency_ms

        sig do
          params(
            error_count: Integer,
            success_count: Integer,
            total_cost: Float,
            total_invocations: Integer,
            total_tokens_used: Integer,
            avg_latency_ms: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          error_count:,
          success_count:,
          # Total cost in USD.
          total_cost:,
          total_invocations:,
          total_tokens_used:,
          avg_latency_ms: nil
        )
        end

        sig do
          override.returns(
            {
              error_count: Integer,
              success_count: Integer,
              total_cost: Float,
              total_invocations: Integer,
              total_tokens_used: Integer,
              avg_latency_ms: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
