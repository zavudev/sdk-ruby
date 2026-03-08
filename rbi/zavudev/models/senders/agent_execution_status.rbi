# typed: strong

module Zavudev
  module Models
    module Senders
      # Status of an agent execution.
      module AgentExecutionStatus
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::Senders::AgentExecutionStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS =
          T.let(:success, Zavudev::Senders::AgentExecutionStatus::TaggedSymbol)
        ERROR =
          T.let(:error, Zavudev::Senders::AgentExecutionStatus::TaggedSymbol)
        FILTERED =
          T.let(:filtered, Zavudev::Senders::AgentExecutionStatus::TaggedSymbol)
        RATE_LIMITED =
          T.let(
            :rate_limited,
            Zavudev::Senders::AgentExecutionStatus::TaggedSymbol
          )
        BALANCE_INSUFFICIENT =
          T.let(
            :balance_insufficient,
            Zavudev::Senders::AgentExecutionStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::Senders::AgentExecutionStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
