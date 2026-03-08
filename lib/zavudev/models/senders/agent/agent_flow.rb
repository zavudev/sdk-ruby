# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Flows#list
        class AgentFlow < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute agent_id
          #
          #   @return [String]
          required :agent_id, String, api_name: :agentId

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute enabled
          #
          #   @return [Boolean]
          required :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute priority
          #   Priority when multiple flows match (higher = more priority).
          #
          #   @return [Integer]
          required :priority, Integer

          # @!attribute steps
          #
          #   @return [Array<Zavudev::Models::Senders::Agent::AgentFlow::Step>]
          required :steps, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::AgentFlow::Step] }

          # @!attribute trigger
          #
          #   @return [Zavudev::Models::Senders::Agent::AgentFlow::Trigger]
          required :trigger, -> { Zavudev::Senders::Agent::AgentFlow::Trigger }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!method initialize(id:, agent_id:, created_at:, enabled:, name:, priority:, steps:, trigger:, updated_at:, description: nil)
          #   @param id [String]
          #
          #   @param agent_id [String]
          #
          #   @param created_at [Time]
          #
          #   @param enabled [Boolean]
          #
          #   @param name [String]
          #
          #   @param priority [Integer] Priority when multiple flows match (higher = more priority).
          #
          #   @param steps [Array<Zavudev::Models::Senders::Agent::AgentFlow::Step>]
          #
          #   @param trigger [Zavudev::Models::Senders::Agent::AgentFlow::Trigger]
          #
          #   @param updated_at [Time]
          #
          #   @param description [String, nil]

          class Step < Zavudev::Internal::Type::BaseModel
            # @!attribute id
            #   Unique step identifier.
            #
            #   @return [String]
            required :id, String

            # @!attribute config
            #   Step configuration (varies by type).
            #
            #   @return [Hash{Symbol=>Object}]
            required :config, Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown]

            # @!attribute type
            #   Type of flow step.
            #
            #   @return [Symbol, Zavudev::Models::Senders::Agent::AgentFlow::Step::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::AgentFlow::Step::Type }

            # @!attribute next_step_id
            #   ID of the next step to execute.
            #
            #   @return [String, nil]
            optional :next_step_id, String, api_name: :nextStepId, nil?: true

            # @!method initialize(id:, config:, type:, next_step_id: nil)
            #   @param id [String] Unique step identifier.
            #
            #   @param config [Hash{Symbol=>Object}] Step configuration (varies by type).
            #
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::AgentFlow::Step::Type] Type of flow step.
            #
            #   @param next_step_id [String, nil] ID of the next step to execute.

            # Type of flow step.
            #
            # @see Zavudev::Models::Senders::Agent::AgentFlow::Step#type
            module Type
              extend Zavudev::Internal::Type::Enum

              MESSAGE = :message
              COLLECT = :collect
              CONDITION = :condition
              TOOL = :tool
              LLM = :llm
              TRANSFER = :transfer

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Zavudev::Models::Senders::Agent::AgentFlow#trigger
          class Trigger < Zavudev::Internal::Type::BaseModel
            # @!attribute type
            #   Type of trigger for a flow.
            #
            #   @return [Symbol, Zavudev::Models::Senders::Agent::AgentFlow::Trigger::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::AgentFlow::Trigger::Type }

            # @!attribute intent
            #   Intent that triggers the flow (for intent type).
            #
            #   @return [String, nil]
            optional :intent, String

            # @!attribute keywords
            #   Keywords that trigger the flow (for keyword type).
            #
            #   @return [Array<String>, nil]
            optional :keywords, Zavudev::Internal::Type::ArrayOf[String]

            # @!method initialize(type:, intent: nil, keywords: nil)
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::AgentFlow::Trigger::Type] Type of trigger for a flow.
            #
            #   @param intent [String] Intent that triggers the flow (for intent type).
            #
            #   @param keywords [Array<String>] Keywords that trigger the flow (for keyword type).

            # Type of trigger for a flow.
            #
            # @see Zavudev::Models::Senders::Agent::AgentFlow::Trigger#type
            module Type
              extend Zavudev::Internal::Type::Enum

              KEYWORD = :keyword
              INTENT = :intent
              ALWAYS = :always
              MANUAL = :manual

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      AgentFlow = Agent::AgentFlow
    end
  end
end
