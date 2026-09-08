# frozen_string_literal: true

module Zavudev
  module Models
    module Agents
      # @see Zavudev::Resources::Agents::Senders#connect
      class SenderConnectResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute agent
        #   AI Agent configuration for a sender.
        #
        #   @return [Zavudev::Models::Senders::SendersAgent]
        required :agent, -> { Zavudev::Senders::SendersAgent }

        # @!method initialize(agent:)
        #   @param agent [Zavudev::Models::Senders::SendersAgent] AI Agent configuration for a sender.
      end
    end
  end
end
