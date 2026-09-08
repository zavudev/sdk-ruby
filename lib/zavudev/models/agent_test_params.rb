# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Agents#test_
    class AgentTestParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute agent_id
      #
      #   @return [String]
      required :agent_id, String

      # @!attribute message
      #   What to say to the agent.
      #
      #   @return [String]
      required :message, String

      # @!attribute execute_tools
      #   Run the tools the agent calls instead of reporting the choice and stopping.
      #
      #   Off by default because a tool handler talks to the outside world: a rehearsal
      #   that charges a card is not a rehearsal. Turn it on to exercise the loop that
      #   actually matters — the model picks a tool, the handler answers, the model
      #   replies with the result — without sending a message to anyone. What ran comes
      #   back in `executedToolCalls`.
      #
      #   @return [Boolean, nil]
      optional :execute_tools, Zavudev::Internal::Type::Boolean, api_name: :executeTools

      # @!attribute history
      #   Prior turns, oldest first, to exercise multi-turn behaviour without persisting a
      #   thread. Trimmed to the agent's context window.
      #
      #   @return [Array<Zavudev::Models::AgentTestParams::History>, nil]
      optional :history, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::AgentTestParams::History] }

      # @!attribute use_knowledge_base
      #   Set false to skip retrieval and isolate prompt behaviour from the knowledge
      #   base.
      #
      #   @return [Boolean, nil]
      optional :use_knowledge_base, Zavudev::Internal::Type::Boolean, api_name: :useKnowledgeBase

      # @!method initialize(agent_id:, message:, execute_tools: nil, history: nil, use_knowledge_base: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::AgentTestParams} for more details.
      #
      #   @param agent_id [String]
      #
      #   @param message [String] What to say to the agent.
      #
      #   @param execute_tools [Boolean] Run the tools the agent calls instead of reporting the choice and stopping.
      #
      #   @param history [Array<Zavudev::Models::AgentTestParams::History>] Prior turns, oldest first, to exercise multi-turn behaviour without persisting a
      #
      #   @param use_knowledge_base [Boolean] Set false to skip retrieval and isolate prompt behaviour from the knowledge base
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      class History < Zavudev::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String]
        required :content, String

        # @!attribute role
        #
        #   @return [Symbol, Zavudev::Models::AgentTestParams::History::Role]
        required :role, enum: -> { Zavudev::AgentTestParams::History::Role }

        # @!method initialize(content:, role:)
        #   @param content [String]
        #   @param role [Symbol, Zavudev::Models::AgentTestParams::History::Role]

        # @see Zavudev::Models::AgentTestParams::History#role
        module Role
          extend Zavudev::Internal::Type::Enum

          USER = :user
          ASSISTANT = :assistant

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
