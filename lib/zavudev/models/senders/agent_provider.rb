# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # LLM provider for the AI agent.
      module AgentProvider
        extend Zavudev::Internal::Type::Enum

        OPENAI = :openai
        ANTHROPIC = :anthropic
        GOOGLE = :google
        MISTRAL = :mistral
        ZAVU = :zavu

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
