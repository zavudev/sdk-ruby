# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class Tools
          # Create a new tool for an agent. Tools allow the agent to call external webhooks.
          #
          # @overload create(sender_id, description:, name:, parameters:, webhook_url:, enabled: nil, webhook_secret: nil, request_options: {})
          #
          # @param sender_id [String]
          #
          # @param description [String]
          #
          # @param name [String]
          #
          # @param parameters [Zavudev::Models::Senders::Agent::ToolParameters]
          #
          # @param webhook_url [String] Must be HTTPS.
          #
          # @param enabled [Boolean]
          #
          # @param webhook_secret [String] Optional secret for webhook signature verification.
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::ToolCreateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::ToolCreateParams
          def create(sender_id, params)
            parsed, options = Zavudev::Senders::Agent::ToolCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/senders/%1$s/agent/tools", sender_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::ToolCreateResponse,
              options: options
            )
          end

          # Get a specific tool.
          #
          # @overload retrieve(tool_id, sender_id:, request_options: {})
          #
          # @param tool_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::ToolRetrieveResponse]
          #
          # @see Zavudev::Models::Senders::Agent::ToolRetrieveParams
          def retrieve(tool_id, params)
            parsed, options = Zavudev::Senders::Agent::ToolRetrieveParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/tools/%2$s", sender_id, tool_id],
              model: Zavudev::Models::Senders::Agent::ToolRetrieveResponse,
              options: options
            )
          end

          # Update a tool.
          #
          # @overload update(tool_id, sender_id:, description: nil, enabled: nil, name: nil, parameters: nil, webhook_secret: nil, webhook_url: nil, request_options: {})
          #
          # @param tool_id [String] Path param
          #
          # @param sender_id [String] Path param
          #
          # @param description [String] Body param
          #
          # @param enabled [Boolean] Body param
          #
          # @param name [String] Body param
          #
          # @param parameters [Zavudev::Models::Senders::Agent::ToolParameters] Body param
          #
          # @param webhook_secret [String, nil] Body param
          #
          # @param webhook_url [String] Body param
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::ToolUpdateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::ToolUpdateParams
          def update(tool_id, params)
            parsed, options = Zavudev::Senders::Agent::ToolUpdateParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :patch,
              path: ["v1/senders/%1$s/agent/tools/%2$s", sender_id, tool_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::ToolUpdateResponse,
              options: options
            )
          end

          # List tools for an agent.
          #
          # @overload list(sender_id, cursor: nil, enabled: nil, limit: nil, request_options: {})
          #
          # @param sender_id [String]
          # @param cursor [String]
          # @param enabled [Boolean]
          # @param limit [Integer]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Internal::Cursor<Zavudev::Models::Senders::Agent::AgentTool>]
          #
          # @see Zavudev::Models::Senders::Agent::ToolListParams
          def list(sender_id, params = {})
            parsed, options = Zavudev::Senders::Agent::ToolListParams.dump_request(params)
            query = Zavudev::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/tools", sender_id],
              query: query,
              page: Zavudev::Internal::Cursor,
              model: Zavudev::Senders::Agent::AgentTool,
              options: options
            )
          end

          # Delete a tool.
          #
          # @overload delete(tool_id, sender_id:, request_options: {})
          #
          # @param tool_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see Zavudev::Models::Senders::Agent::ToolDeleteParams
          def delete(tool_id, params)
            parsed, options = Zavudev::Senders::Agent::ToolDeleteParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/senders/%1$s/agent/tools/%2$s", sender_id, tool_id],
              model: NilClass,
              options: options
            )
          end

          # Test a tool by triggering its webhook with test parameters.
          #
          # @overload test_(tool_id, sender_id:, test_params:, request_options: {})
          #
          # @param tool_id [String] Path param
          #
          # @param sender_id [String] Path param
          #
          # @param test_params [Hash{Symbol=>Object}] Body param: Parameters to pass to the tool for testing.
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::ToolTestResponse]
          #
          # @see Zavudev::Models::Senders::Agent::ToolTestParams
          def test_(tool_id, params)
            parsed, options = Zavudev::Senders::Agent::ToolTestParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/senders/%1$s/agent/tools/%2$s/test", sender_id, tool_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::ToolTestResponse,
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
