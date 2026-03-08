# typed: strong

module Zavudev
  module Models
    class PhoneNumberCapabilities < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::PhoneNumberCapabilities, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :mms

      sig { params(mms: T::Boolean).void }
      attr_writer :mms

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sms

      sig { params(sms: T::Boolean).void }
      attr_writer :sms

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :voice

      sig { params(voice: T::Boolean).void }
      attr_writer :voice

      sig do
        params(mms: T::Boolean, sms: T::Boolean, voice: T::Boolean).returns(
          T.attached_class
        )
      end
      def self.new(mms: nil, sms: nil, voice: nil)
      end

      sig do
        override.returns(
          { mms: T::Boolean, sms: T::Boolean, voice: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
