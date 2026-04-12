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
          #   @return [Array<Zavudev::Models::Senders::Agent::FlowStep>]
          required :steps, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::FlowStep] }

          # @!attribute trigger
          #
          #   @return [Zavudev::Models::Senders::Agent::FlowTrigger]
          required :trigger, -> { Zavudev::Senders::Agent::FlowTrigger }

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
          #   @param steps [Array<Zavudev::Models::Senders::Agent::FlowStep>]
          #
          #   @param trigger [Zavudev::Models::Senders::Agent::FlowTrigger]
          #
          #   @param updated_at [Time]
          #
          #   @param description [String, nil]
        end
      end

      AgentFlow = Agent::AgentFlow
    end
  end
end
