# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#retrieve
        class ToolRetrieveResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute tool
          #
          #   @return [Zavudev::Models::Senders::Agent::AgentTool]
          required :tool, -> { Zavudev::Senders::Agent::AgentTool }

          # @!method initialize(tool:)
          #   @param tool [Zavudev::Models::Senders::Agent::AgentTool]
        end
      end
    end
  end
end
