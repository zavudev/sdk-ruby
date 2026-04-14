# typed: strong

module Zavudev
  module Models
    class InvitationCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::InvitationCreateParams, Zavudev::Internal::AnyHash)
        end

      # ISO country codes for allowed phone numbers.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :allowed_phone_countries

      sig { params(allowed_phone_countries: T::Array[String]).void }
      attr_writer :allowed_phone_countries

      # Email of the client being invited.
      sig { returns(T.nilable(String)) }
      attr_reader :client_email

      sig { params(client_email: String).void }
      attr_writer :client_email

      # Name of the client being invited.
      sig { returns(T.nilable(String)) }
      attr_reader :client_name

      sig { params(client_name: String).void }
      attr_writer :client_name

      # Phone number of the client in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :client_phone

      sig { params(client_phone: String).void }
      attr_writer :client_phone

      # Number of days until the invitation expires.
      sig { returns(T.nilable(Integer)) }
      attr_reader :expires_in_days

      sig { params(expires_in_days: Integer).void }
      attr_writer :expires_in_days

      # ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      # the client will use this number instead of their own.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number_id

      sig { params(phone_number_id: String).void }
      attr_writer :phone_number_id

      sig do
        params(
          allowed_phone_countries: T::Array[String],
          client_email: String,
          client_name: String,
          client_phone: String,
          expires_in_days: Integer,
          phone_number_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ISO country codes for allowed phone numbers.
        allowed_phone_countries: nil,
        # Email of the client being invited.
        client_email: nil,
        # Name of the client being invited.
        client_name: nil,
        # Phone number of the client in E.164 format.
        client_phone: nil,
        # Number of days until the invitation expires.
        expires_in_days: nil,
        # ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
        # the client will use this number instead of their own.
        phone_number_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            allowed_phone_countries: T::Array[String],
            client_email: String,
            client_name: String,
            client_phone: String,
            expires_in_days: Integer,
            phone_number_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
