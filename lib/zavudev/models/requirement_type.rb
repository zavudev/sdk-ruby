# frozen_string_literal: true

module Zavudev
  module Models
    class RequirementType < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute description
      #
      #   @return [String]
      required :description, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   Type of requirement field.
      #
      #   @return [Symbol, Zavudev::Models::RequirementFieldType]
      required :type, enum: -> { Zavudev::RequirementFieldType }

      # @!attribute acceptance_criteria
      #   Acceptance criteria for a requirement.
      #
      #   @return [Zavudev::Models::RequirementAcceptanceCriteria, nil]
      optional :acceptance_criteria,
               -> { Zavudev::RequirementAcceptanceCriteria },
               api_name: :acceptanceCriteria

      # @!attribute example
      #
      #   @return [String, nil]
      optional :example, String, nil?: true

      # @!method initialize(id:, description:, name:, type:, acceptance_criteria: nil, example: nil)
      #   A specific requirement type within a requirement group.
      #
      #   @param id [String]
      #
      #   @param description [String]
      #
      #   @param name [String]
      #
      #   @param type [Symbol, Zavudev::Models::RequirementFieldType] Type of requirement field.
      #
      #   @param acceptance_criteria [Zavudev::Models::RequirementAcceptanceCriteria] Acceptance criteria for a requirement.
      #
      #   @param example [String, nil]
    end
  end
end
