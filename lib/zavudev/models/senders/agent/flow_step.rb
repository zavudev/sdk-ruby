# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowStep < Zavudev::Internal::Type::BaseModel
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
          #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowStep::Type]
          required :type, enum: -> { Zavudev::Senders::Agent::FlowStep::Type }

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
          #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowStep::Type] Type of flow step.
          #
          #   @param next_step_id [String, nil] ID of the next step to execute.

          # Type of flow step.
          #
          # @see Zavudev::Models::Senders::Agent::FlowStep#type
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
      end
    end
  end
end
