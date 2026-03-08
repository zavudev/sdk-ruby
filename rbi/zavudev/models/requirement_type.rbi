# typed: strong

module Zavudev
  module Models
    class RequirementType < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::RequirementType, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :description

      sig { returns(String) }
      attr_accessor :name

      # Type of requirement field.
      sig { returns(Zavudev::RequirementFieldType::TaggedSymbol) }
      attr_accessor :type

      # Acceptance criteria for a requirement.
      sig { returns(T.nilable(Zavudev::RequirementAcceptanceCriteria)) }
      attr_reader :acceptance_criteria

      sig do
        params(
          acceptance_criteria: Zavudev::RequirementAcceptanceCriteria::OrHash
        ).void
      end
      attr_writer :acceptance_criteria

      sig { returns(T.nilable(String)) }
      attr_accessor :example

      # A specific requirement type within a requirement group.
      sig do
        params(
          id: String,
          description: String,
          name: String,
          type: Zavudev::RequirementFieldType::OrSymbol,
          acceptance_criteria: Zavudev::RequirementAcceptanceCriteria::OrHash,
          example: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        description:,
        name:,
        # Type of requirement field.
        type:,
        # Acceptance criteria for a requirement.
        acceptance_criteria: nil,
        example: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            description: String,
            name: String,
            type: Zavudev::RequirementFieldType::TaggedSymbol,
            acceptance_criteria: Zavudev::RequirementAcceptanceCriteria,
            example: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
