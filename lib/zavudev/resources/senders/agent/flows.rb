# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class Flows
          # Create a new flow for an agent.
          #
          # @overload create(sender_id, name:, steps:, trigger:, description: nil, enabled: nil, priority: nil, request_options: {})
          #
          # @param sender_id [String]
          # @param name [String]
          # @param steps [Array<Zavudev::Models::Senders::Agent::FlowCreateParams::Step>]
          # @param trigger [Zavudev::Models::Senders::Agent::FlowCreateParams::Trigger]
          # @param description [String]
          # @param enabled [Boolean]
          # @param priority [Integer]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::FlowCreateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::FlowCreateParams
          def create(sender_id, params)
            parsed, options = Zavudev::Senders::Agent::FlowCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/senders/%1$s/agent/flows", sender_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::FlowCreateResponse,
              options: options
            )
          end

          # Get a specific flow.
          #
          # @overload retrieve(flow_id, sender_id:, request_options: {})
          #
          # @param flow_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::FlowRetrieveResponse]
          #
          # @see Zavudev::Models::Senders::Agent::FlowRetrieveParams
          def retrieve(flow_id, params)
            parsed, options = Zavudev::Senders::Agent::FlowRetrieveParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/flows/%2$s", sender_id, flow_id],
              model: Zavudev::Models::Senders::Agent::FlowRetrieveResponse,
              options: options
            )
          end

          # Update a flow.
          #
          # @overload update(flow_id, sender_id:, description: nil, enabled: nil, name: nil, priority: nil, steps: nil, trigger: nil, request_options: {})
          #
          # @param flow_id [String] Path param
          #
          # @param sender_id [String] Path param
          #
          # @param description [String] Body param
          #
          # @param enabled [Boolean] Body param
          #
          # @param name [String] Body param
          #
          # @param priority [Integer] Body param
          #
          # @param steps [Array<Zavudev::Models::Senders::Agent::FlowUpdateParams::Step>] Body param
          #
          # @param trigger [Zavudev::Models::Senders::Agent::FlowUpdateParams::Trigger] Body param
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::FlowUpdateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::FlowUpdateParams
          def update(flow_id, params)
            parsed, options = Zavudev::Senders::Agent::FlowUpdateParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :patch,
              path: ["v1/senders/%1$s/agent/flows/%2$s", sender_id, flow_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::FlowUpdateResponse,
              options: options
            )
          end

          # List flows for an agent.
          #
          # @overload list(sender_id, cursor: nil, enabled: nil, limit: nil, request_options: {})
          #
          # @param sender_id [String]
          # @param cursor [String]
          # @param enabled [Boolean]
          # @param limit [Integer]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Internal::Cursor<Zavudev::Models::Senders::Agent::AgentFlow>]
          #
          # @see Zavudev::Models::Senders::Agent::FlowListParams
          def list(sender_id, params = {})
            parsed, options = Zavudev::Senders::Agent::FlowListParams.dump_request(params)
            query = Zavudev::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/flows", sender_id],
              query: query,
              page: Zavudev::Internal::Cursor,
              model: Zavudev::Senders::Agent::AgentFlow,
              options: options
            )
          end

          # Delete a flow. Cannot delete flows with active sessions.
          #
          # @overload delete(flow_id, sender_id:, request_options: {})
          #
          # @param flow_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see Zavudev::Models::Senders::Agent::FlowDeleteParams
          def delete(flow_id, params)
            parsed, options = Zavudev::Senders::Agent::FlowDeleteParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/senders/%1$s/agent/flows/%2$s", sender_id, flow_id],
              model: NilClass,
              options: options
            )
          end

          # Create a copy of an existing flow with a new name.
          #
          # @overload duplicate(flow_id, sender_id:, new_name:, request_options: {})
          #
          # @param flow_id [String] Path param
          #
          # @param sender_id [String] Path param
          #
          # @param new_name [String] Body param
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::FlowDuplicateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::FlowDuplicateParams
          def duplicate(flow_id, params)
            parsed, options = Zavudev::Senders::Agent::FlowDuplicateParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/senders/%1$s/agent/flows/%2$s/duplicate", sender_id, flow_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::FlowDuplicateResponse,
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
