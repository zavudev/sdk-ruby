# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Executions#retrieve
        class ExecutionRetrieveResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute execution
          #
          #   @return [Zavudev::Models::Senders::AgentExecution]
          required :execution, -> { Zavudev::Senders::AgentExecution }

          # @!method initialize(execution:)
          #   @param execution [Zavudev::Models::Senders::AgentExecution]
        end
      end
    end
  end
end
