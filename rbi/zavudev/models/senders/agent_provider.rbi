# typed: strong

module Zavudev
  module Models
    module Senders
      # LLM provider for the AI agent.
      module AgentProvider
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::Senders::AgentProvider) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI = T.let(:openai, Zavudev::Senders::AgentProvider::TaggedSymbol)
        ANTHROPIC =
          T.let(:anthropic, Zavudev::Senders::AgentProvider::TaggedSymbol)
        GOOGLE = T.let(:google, Zavudev::Senders::AgentProvider::TaggedSymbol)
        MISTRAL = T.let(:mistral, Zavudev::Senders::AgentProvider::TaggedSymbol)
        ZAVU = T.let(:zavu, Zavudev::Senders::AgentProvider::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::Senders::AgentProvider::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
