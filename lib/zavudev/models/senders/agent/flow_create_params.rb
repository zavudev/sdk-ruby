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
          #   @return [Array<Zavudev::Models::Senders::Agent::FlowStep>]
          required :steps, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::FlowStep] }

          # @!attribute trigger
          #
          #   @return [Zavudev::Models::Senders::Agent::FlowTrigger]
          required :trigger, -> { Zavudev::Senders::Agent::FlowTrigger }

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
          #   @param steps [Array<Zavudev::Models::Senders::Agent::FlowStep>]
          #   @param trigger [Zavudev::Models::Senders::Agent::FlowTrigger]
          #   @param description [String]
          #   @param enabled [Boolean]
          #   @param priority [Integer]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
