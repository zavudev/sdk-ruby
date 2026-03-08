# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Flows#create
        class FlowCreateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute steps
          #
          #   @return [Array<Zavudev::Models::Senders::Agent::FlowCreateParams::Step>]
          required :steps, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::FlowCreateParams::Step] }

          # @!attribute trigger
          #
          #   @return [Zavudev::Models::Senders::Agent::FlowCreateParams::Trigger]
          required :trigger, -> { Zavudev::Senders::Agent::FlowCreateParams::Trigger }

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute enabled
          #
          #   @return [Boolean, nil]
          optional :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute priority
          #
          #   @return [Integer, nil]
          optional :priority, Integer

          # @!method initialize(sender_id:, name:, steps:, trigger:, description: nil, enabled: nil, priority: nil, request_options: {})
          #   @param sender_id [String]
          #   @param name [String]
          #   @param steps [Array<Zavudev::Models::Senders::Agent::FlowCreateParams::Step>]
          #   @param trigger [Zavudev::Models::Senders::Agent::FlowCreateParams::Trigger]
          #   @param description [String]
          #   @param enabled [Boolean]
          #   @param priority [Integer]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

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
            #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowCreateParams::Step::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::FlowCreateParams::Step::Type }

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
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowCreateParams::Step::Type] Type of flow step.
            #
            #   @param next_step_id [String, nil] ID of the next step to execute.

            # Type of flow step.
            #
            # @see Zavudev::Models::Senders::Agent::FlowCreateParams::Step#type
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

          class Trigger < Zavudev::Internal::Type::BaseModel
            # @!attribute type
            #   Type of trigger for a flow.
            #
            #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowCreateParams::Trigger::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type }

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
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowCreateParams::Trigger::Type] Type of trigger for a flow.
            #
            #   @param intent [String] Intent that triggers the flow (for intent type).
            #
            #   @param keywords [Array<String>] Keywords that trigger the flow (for keyword type).

            # Type of trigger for a flow.
            #
            # @see Zavudev::Models::Senders::Agent::FlowCreateParams::Trigger#type
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
    end
  end
end
