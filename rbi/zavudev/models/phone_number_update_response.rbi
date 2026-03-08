# typed: strong

module Zavudev
  module Models
    class PhoneNumberUpdateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::PhoneNumberUpdateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::OwnedPhoneNumber) }
      attr_reader :phone_number

      sig { params(phone_number: Zavudev::OwnedPhoneNumber::OrHash).void }
      attr_writer :phone_number

      sig do
        params(phone_number: Zavudev::OwnedPhoneNumber::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(phone_number:)
      end

      sig { override.returns({ phone_number: Zavudev::OwnedPhoneNumber }) }
      def to_hash
      end
    end
  end
end
