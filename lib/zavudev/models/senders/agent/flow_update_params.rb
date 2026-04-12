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
          #   @return [Array<Zavudev::Models::Senders::Agent::FlowStep>, nil]
          optional :steps, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::FlowStep] }

          # @!attribute trigger
          #
          #   @return [Zavudev::Models::Senders::Agent::FlowTrigger, nil]
          optional :trigger, -> { Zavudev::Senders::Agent::FlowTrigger }

          # @!method initialize(sender_id:, flow_id:, description: nil, enabled: nil, name: nil, priority: nil, steps: nil, trigger: nil, request_options: {})
          #   @param sender_id [String]
          #   @param flow_id [String]
          #   @param description [String]
          #   @param enabled [Boolean]
          #   @param name [String]
          #   @param priority [Integer]
          #   @param steps [Array<Zavudev::Models::Senders::Agent::FlowStep>]
          #   @param trigger [Zavudev::Models::Senders::Agent::FlowTrigger]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
