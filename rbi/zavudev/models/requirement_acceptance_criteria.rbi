# typed: strong

module Zavudev
  module Models
    class RequirementAcceptanceCriteria < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::RequirementAcceptanceCriteria,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :allowed_values

      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_length

      sig { returns(T.nilable(Integer)) }
      attr_accessor :min_length

      sig { returns(T.nilable(String)) }
      attr_accessor :regex_pattern

      # Acceptance criteria for a requirement.
      sig do
        params(
          allowed_values: T.nilable(T::Array[String]),
          max_length: T.nilable(Integer),
          min_length: T.nilable(Integer),
          regex_pattern: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        allowed_values: nil,
        max_length: nil,
        min_length: nil,
        regex_pattern: nil
      )
      end

      sig do
        override.returns(
          {
            allowed_values: T.nilable(T::Array[String]),
            max_length: T.nilable(Integer),
            min_length: T.nilable(Integer),
            regex_pattern: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
