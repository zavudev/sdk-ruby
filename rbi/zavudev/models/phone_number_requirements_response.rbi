# typed: strong

module Zavudev
  module Models
    class PhoneNumberRequirementsResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::PhoneNumberRequirementsResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Zavudev::Requirement]) }
      attr_accessor :items

      sig do
        params(items: T::Array[Zavudev::Requirement::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(items:)
      end

      sig { override.returns({ items: T::Array[Zavudev::Requirement] }) }
      def to_hash
      end
    end
  end
end
