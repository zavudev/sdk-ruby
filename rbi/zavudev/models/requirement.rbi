# typed: strong

module Zavudev
  module Models
    class Requirement < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Requirement, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :action

      sig { returns(String) }
      attr_accessor :country_code

      sig { returns(String) }
      attr_accessor :phone_number_type

      sig { returns(T::Array[Zavudev::RequirementType]) }
      attr_accessor :requirement_types

      # The requirements for ordering a number: for a country and number type, or for
      # one specific number when requested with `phoneNumber` (then `id` is that phone
      # number and `countryCode` is taken from it).
      sig do
        params(
          id: String,
          action: String,
          country_code: String,
          phone_number_type: String,
          requirement_types: T::Array[Zavudev::RequirementType::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        action:,
        country_code:,
        phone_number_type:,
        requirement_types:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            action: String,
            country_code: String,
            phone_number_type: String,
            requirement_types: T::Array[Zavudev::RequirementType]
          }
        )
      end
      def to_hash
      end
    end
  end
end
