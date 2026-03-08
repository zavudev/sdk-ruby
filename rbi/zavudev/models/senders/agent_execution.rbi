# typed: strong

module Zavudev
  module Models
    module Senders
      class AgentExecution < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Senders::AgentExecution, Zavudev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :agent_id

        # Cost in USD.
        sig { returns(Float) }
        attr_accessor :cost

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(Integer) }
        attr_accessor :input_tokens

        sig { returns(Integer) }
        attr_accessor :latency_ms

        sig { returns(Integer) }
        attr_accessor :output_tokens

        # Status of an agent execution.
        sig { returns(Zavudev::Senders::AgentExecutionStatus::TaggedSymbol) }
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :error_message

        sig { returns(T.nilable(String)) }
        attr_reader :inbound_message_id

        sig { params(inbound_message_id: String).void }
        attr_writer :inbound_message_id

        sig { returns(T.nilable(String)) }
        attr_accessor :response_message_id

        sig { returns(T.nilable(String)) }
        attr_accessor :response_text

        sig do
          params(
            id: String,
            agent_id: String,
            cost: Float,
            created_at: Time,
            input_tokens: Integer,
            latency_ms: Integer,
            output_tokens: Integer,
            status: Zavudev::Senders::AgentExecutionStatus::OrSymbol,
            error_message: T.nilable(String),
            inbound_message_id: String,
            response_message_id: T.nilable(String),
            response_text: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          agent_id:,
          # Cost in USD.
          cost:,
          created_at:,
          input_tokens:,
          latency_ms:,
          output_tokens:,
          # Status of an agent execution.
          status:,
          error_message: nil,
          inbound_message_id: nil,
          response_message_id: nil,
          response_text: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              agent_id: String,
              cost: Float,
              created_at: Time,
              input_tokens: Integer,
              latency_ms: Integer,
              output_tokens: Integer,
              status: Zavudev::Senders::AgentExecutionStatus::TaggedSymbol,
              error_message: T.nilable(String),
              inbound_message_id: String,
              response_message_id: T.nilable(String),
              response_text: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
