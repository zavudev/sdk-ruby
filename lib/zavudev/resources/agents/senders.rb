# frozen_string_literal: true

module Zavudev
  module Resources
    class Agents
      class Senders
        # Make the agent answer on this sender. An agent can serve several senders; a
        # sender answers with at most one agent, so connecting one that is already in use
        # returns `400` naming the agent that holds it.
        #
        # @overload connect(agent_id, sender_id:, request_options: {})
        #
        # @param agent_id [String] Agent ID.
        #
        # @param sender_id [String] Sender to connect.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Agents::SenderConnectResponse]
        #
        # @see Zavudev::Models::Agents::SenderConnectParams
        def connect(agent_id, params)
          parsed, options = Zavudev::Agents::SenderConnectParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/agents/%1$s/senders", agent_id],
            body: parsed,
            model: Zavudev::Models::Agents::SenderConnectResponse,
            options: options
          )
        end

        # Stop the agent answering on this sender. The agent's primary sender is part of
        # the agent itself and cannot be disconnected here.
        #
        # @overload disconnect(sender_id, agent_id:, request_options: {})
        #
        # @param sender_id [String]
        #
        # @param agent_id [String] Agent ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Agents::SenderDisconnectParams
        def disconnect(sender_id, params)
          parsed, options = Zavudev::Agents::SenderDisconnectParams.dump_request(params)
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/agents/%1$s/senders/%2$s", agent_id, sender_id],
            model: NilClass,
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
