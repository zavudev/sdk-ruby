# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Flows#update
        class FlowUpdateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute flow_id
          #
          #   @return [String]
          required :flow_id, String

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute enabled
          #
          #   @return [Boolean, nil]
          optional :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute priority
          #
          #   @return [Integer, nil]
          optional :priority, Integer

          # @!attribute steps
          #
          #   @return [Array<Zavudev::Models::Senders::Agent::FlowUpdateParams::Step>, nil]
          optional :steps, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::FlowUpdateParams::Step] }

          # @!attribute trigger
          #
          #   @return [Zavudev::Models::Senders::Agent::FlowUpdateParams::Trigger, nil]
          optional :trigger, -> { Zavudev::Senders::Agent::FlowUpdateParams::Trigger }

          # @!method initialize(sender_id:, flow_id:, description: nil, enabled: nil, name: nil, priority: nil, steps: nil, trigger: nil, request_options: {})
          #   @param sender_id [String]
          #   @param flow_id [String]
          #   @param description [String]
          #   @param enabled [Boolean]
          #   @param name [String]
          #   @param priority [Integer]
          #   @param steps [Array<Zavudev::Models::Senders::Agent::FlowUpdateParams::Step>]
          #   @param trigger [Zavudev::Models::Senders::Agent::FlowUpdateParams::Trigger]
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
            #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowUpdateParams::Step::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::FlowUpdateParams::Step::Type }

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
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowUpdateParams::Step::Type] Type of flow step.
            #
            #   @param next_step_id [String, nil] ID of the next step to execute.

            # Type of flow step.
            #
            # @see Zavudev::Models::Senders::Agent::FlowUpdateParams::Step#type
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
            #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowUpdateParams::Trigger::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::FlowUpdateParams::Trigger::Type }

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
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowUpdateParams::Trigger::Type] Type of trigger for a flow.
            #
            #   @param intent [String] Intent that triggers the flow (for intent type).
            #
            #   @param keywords [Array<String>] Keywords that trigger the flow (for keyword type).

            # Type of trigger for a flow.
            #
            # @see Zavudev::Models::Senders::Agent::FlowUpdateParams::Trigger#type
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
