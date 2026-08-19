# typed: strong

module Zavudev
  module Resources
    class Agents
      class Senders
        # Make the agent answer on this sender. An agent can serve several senders; a
        # sender answers with at most one agent, so connecting one that is already in use
        # returns `400` naming the agent that holds it.
        sig do
          params(
            agent_id: String,
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Agents::SenderConnectResponse)
        end
        def connect(
          # Agent ID.
          agent_id,
          # Sender to connect.
          sender_id:,
          request_options: {}
        )
        end

        # Stop the agent answering on this sender. The agent's primary sender is part of
        # the agent itself and cannot be disconnected here.
        sig do
          params(
            sender_id: String,
            agent_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def disconnect(
          sender_id,
          # Agent ID.
          agent_id:,
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
