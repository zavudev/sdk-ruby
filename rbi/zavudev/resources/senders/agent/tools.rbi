# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        class Tools
          # Create a new tool for an agent. Tools allow the agent to call external webhooks.
          sig do
            params(
              sender_id: String,
              description: String,
              name: String,
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash,
              webhook_url: String,
              enabled: T::Boolean,
              webhook_secret: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::ToolCreateResponse)
          end
          def create(
            sender_id,
            description:,
            name:,
            parameters:,
            # Must be HTTPS.
            webhook_url:,
            enabled: nil,
            # Optional secret for webhook signature verification.
            webhook_secret: nil,
            request_options: {}
          )
          end

          # Get a specific tool.
          sig do
            params(
              tool_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::ToolRetrieveResponse)
          end
          def retrieve(tool_id, sender_id:, request_options: {})
          end

          # Update a tool.
          sig do
            params(
              tool_id: String,
              sender_id: String,
              description: String,
              enabled: T::Boolean,
              name: String,
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash,
              webhook_secret: T.nilable(String),
              webhook_url: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::ToolUpdateResponse)
          end
          def update(
            # Path param
            tool_id,
            # Path param
            sender_id:,
            # Body param
            description: nil,
            # Body param
            enabled: nil,
            # Body param
            name: nil,
            # Body param
            parameters: nil,
            # Body param
            webhook_secret: nil,
            # Body param
            webhook_url: nil,
            request_options: {}
          )
          end

          # List tools for an agent.
          sig do
            params(
              sender_id: String,
              cursor: String,
              enabled: T::Boolean,
              limit: Integer,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Internal::Cursor[Zavudev::Senders::Agent::AgentTool]
            )
          end
          def list(
            sender_id,
            cursor: nil,
            enabled: nil,
            limit: nil,
            request_options: {}
          )
          end

          # Delete a tool.
          sig do
            params(
              tool_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).void
          end
          def delete(tool_id, sender_id:, request_options: {})
          end

          # Run a tool with the parameters you supply and return what it answered.
          #
          # The call is synchronous: the response carries the tool's status, body, and
          # duration, so a green result is evidence the tool ran rather than evidence it was
          # accepted. Each run is also recorded and readable afterwards via
          # `GET /v1/senders/{senderId}/agent/tools/{toolId}/test-runs`.
          #
          # A tool that answers with an error is reported as a run with `success: false` —
          # the endpoint itself still returns 200. This fires the tool's real webhook, so a
          # test has whatever side effects the tool has.
          sig do
            params(
              tool_id: String,
              sender_id: String,
              test_params: T::Hash[Symbol, T.anything],
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::ToolTestResponse)
          end
          def test_(
            # Path param
            tool_id,
            # Path param
            sender_id:,
            # Body param: Parameters to pass to the tool for testing.
            test_params:,
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
