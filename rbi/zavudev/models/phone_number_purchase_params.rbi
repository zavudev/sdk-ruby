# typed: strong

module Zavudev
  module Models
    class PhoneNumberPurchaseParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::PhoneNumberPurchaseParams, Zavudev::Internal::AnyHash)
        end

      # Phone number in E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      # Optional custom name for the phone number.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          phone_number: String,
          name: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Phone number in E.164 format.
        phone_number:,
        # Optional custom name for the phone number.
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            phone_number: String,
            name: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
