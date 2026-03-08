# typed: strong

module Zavudev
  module Models
    class PhoneNumberSearchAvailableResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::PhoneNumberSearchAvailableResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Zavudev::AvailablePhoneNumber]) }
      attr_accessor :items

      sig do
        params(items: T::Array[Zavudev::AvailablePhoneNumber::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(items:)
      end

      sig do
        override.returns({ items: T::Array[Zavudev::AvailablePhoneNumber] })
      end
      def to_hash
      end
    end
  end
end
