# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowTrigger < Zavudev::Internal::Type::BaseModel
          # @!attribute type
          #   Type of trigger for a flow.
          #
          #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowTrigger::Type]
          required :type, enum: -> { Zavudev::Senders::Agent::FlowTrigger::Type }

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
          #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowTrigger::Type] Type of trigger for a flow.
          #
          #   @param intent [String] Intent that triggers the flow (for intent type).
          #
          #   @param keywords [Array<String>] Keywords that trigger the flow (for keyword type).

          # Type of trigger for a flow.
          #
          # @see Zavudev::Models::Senders::Agent::FlowTrigger#type
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
