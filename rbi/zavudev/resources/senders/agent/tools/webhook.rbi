# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        class Tools
          class Webhook
            # Generate a new signing secret for this tool. The previous one stops working on
            # the next call, with no overlap, so update your endpoint first. The tool keeps
            # its id, so flows that reference it by name are unaffected.
            sig do
              params(
                tool_id: String,
                sender_id: String,
                request_options: Zavudev::RequestOptions::OrHash
              ).returns(Zavudev::WebhookSecretResponse)
            end
            def rotate_secret(tool_id, sender_id:, request_options: {})
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
end
