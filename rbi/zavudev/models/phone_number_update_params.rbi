# typed: strong

module Zavudev
  module Models
    class PhoneNumberUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::PhoneNumberUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :phone_number_id

      # Custom name for the phone number. Set to null to clear.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Sender ID to assign the phone number to. Set to null to unassign.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_id

      sig do
        params(
          phone_number_id: String,
          name: T.nilable(String),
          sender_id: T.nilable(String),
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        phone_number_id:,
        # Custom name for the phone number. Set to null to clear.
        name: nil,
        # Sender ID to assign the phone number to. Set to null to unassign.
        sender_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            phone_number_id: String,
            name: T.nilable(String),
            sender_id: T.nilable(String),
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
