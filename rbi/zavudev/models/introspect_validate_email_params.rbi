# typed: strong

module Zavudev
  module Models
    class IntrospectValidateEmailParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::IntrospectValidateEmailParams,
            Zavudev::Internal::AnyHash
          )
        end

      # Single email address to validate.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Batch of email addresses to validate (max 100).
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :emails

      sig { params(emails: T::Array[String]).void }
      attr_writer :emails

      sig do
        params(
          email: String,
          emails: T::Array[String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Single email address to validate.
        email: nil,
        # Batch of email addresses to validate (max 100).
        emails: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            email: String,
            emails: T::Array[String],
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
