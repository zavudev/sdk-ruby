# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolParameters < Zavudev::Internal::Type::BaseModel
          # @!attribute properties
          #
          #   @return [Hash{Symbol=>Zavudev::Models::Senders::Agent::ToolParameters::Property}]
          required :properties,
                   -> { Zavudev::Internal::Type::HashOf[Zavudev::Senders::Agent::ToolParameters::Property] }

          # @!attribute required
          #
          #   @return [Array<String>]
          required :required, Zavudev::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, Zavudev::Models::Senders::Agent::ToolParameters::Type]
          required :type, enum: -> { Zavudev::Senders::Agent::ToolParameters::Type }

          # @!method initialize(properties:, required:, type:)
          #   @param properties [Hash{Symbol=>Zavudev::Models::Senders::Agent::ToolParameters::Property}]
          #   @param required [Array<String>]
          #   @param type [Symbol, Zavudev::Models::Senders::Agent::ToolParameters::Type]

          class Property < Zavudev::Internal::Type::BaseModel
            # @!attribute description
            #
            #   @return [String, nil]
            optional :description, String

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String

            # @!method initialize(description: nil, type: nil)
            #   @param description [String]
            #   @param type [String]
          end

          # @see Zavudev::Models::Senders::Agent::ToolParameters#type
          module Type
            extend Zavudev::Internal::Type::Enum

            OBJECT = :object

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
