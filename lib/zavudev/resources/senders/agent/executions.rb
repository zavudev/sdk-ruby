# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class Executions
          # Fetch full details for one execution — including `errorMessage`, `errorCode`,
          # and `responseText`. Use this to debug failures surfaced by the list endpoint.
          #
          # @overload retrieve(execution_id, sender_id:, request_options: {})
          #
          # @param execution_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::ExecutionRetrieveResponse]
          #
          # @see Zavudev::Models::Senders::Agent::ExecutionRetrieveParams
          def retrieve(execution_id, params)
            parsed, options = Zavudev::Senders::Agent::ExecutionRetrieveParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/executions/%2$s", sender_id, execution_id],
              model: Zavudev::Models::Senders::Agent::ExecutionRetrieveResponse,
              options: options
            )
          end

          # List recent agent executions with pagination.
          #
          # @overload list(sender_id, cursor: nil, limit: nil, status: nil, request_options: {})
          #
          # @param sender_id [String]
          #
          # @param cursor [String]
          #
          # @param limit [Integer]
          #
          # @param status [Symbol, Zavudev::Models::Senders::AgentExecutionStatus] Status of an agent execution.
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Internal::Cursor<Zavudev::Models::Senders::AgentExecution>]
          #
          # @see Zavudev::Models::Senders::Agent::ExecutionListParams
          def list(sender_id, params = {})
            parsed, options = Zavudev::Senders::Agent::ExecutionListParams.dump_request(params)
            query = Zavudev::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/executions", sender_id],
              query: query,
              page: Zavudev::Internal::Cursor,
              model: Zavudev::Senders::AgentExecution,
              options: options
            )
          end

          # @api private
          #
          # @param client [Zavudev::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
