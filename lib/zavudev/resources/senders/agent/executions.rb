# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class Executions
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
