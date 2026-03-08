# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # Status of an agent execution.
      module AgentExecutionStatus
        extend Zavudev::Internal::Type::Enum

        SUCCESS = :success
        ERROR = :error
        FILTERED = :filtered
        RATE_LIMITED = :rate_limited
        BALANCE_INSUFFICIENT = :balance_insufficient

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
