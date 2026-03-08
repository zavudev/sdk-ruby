# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Flows#duplicate
        class FlowDuplicateResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute flow
          #
          #   @return [Zavudev::Models::Senders::Agent::AgentFlow]
          required :flow, -> { Zavudev::Senders::Agent::AgentFlow }

          # @!method initialize(flow:)
          #   @param flow [Zavudev::Models::Senders::Agent::AgentFlow]
        end
      end
    end
  end
end
