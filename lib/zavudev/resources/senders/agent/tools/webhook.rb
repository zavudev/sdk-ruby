# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class Tools
          class Webhook
            # Generate a new signing secret for this tool. The previous one stops working on
            # the next call, with no overlap, so update your endpoint first. The tool keeps
            # its id, so flows that reference it by name are unaffected.
            #
            # @overload rotate_secret(tool_id, sender_id:, request_options: {})
            #
            # @param tool_id [String]
            # @param sender_id [String]
            # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Zavudev::Models::WebhookSecretResponse]
            #
            # @see Zavudev::Models::Senders::Agent::Tools::WebhookRotateSecretParams
            def rotate_secret(tool_id, params)
              parsed, options = Zavudev::Senders::Agent::Tools::WebhookRotateSecretParams.dump_request(params)
              sender_id =
                parsed.delete(:sender_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :post,
                path: ["v1/senders/%1$s/agent/tools/%2$s/webhook/secret", sender_id, tool_id],
                model: Zavudev::WebhookSecretResponse,
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
end
