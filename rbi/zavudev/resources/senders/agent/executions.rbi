# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        class Executions
          # Fetch full details for one execution — including `errorMessage`, `errorCode`,
          # and `responseText`. Use this to debug failures surfaced by the list endpoint.
          sig do
            params(
              execution_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Models::Senders::Agent::ExecutionRetrieveResponse
            )
          end
          def retrieve(execution_id, sender_id:, request_options: {})
          end

          # List recent agent executions with pagination.
          sig do
            params(
              sender_id: String,
              cursor: String,
              limit: Integer,
              status: Zavudev::Senders::AgentExecutionStatus::OrSymbol,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Internal::Cursor[Zavudev::Senders::AgentExecution]
            )
          end
          def list(
            sender_id,
            cursor: nil,
            limit: nil,
            # Status of an agent execution.
            status: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Zavudev::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
