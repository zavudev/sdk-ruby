# typed: strong

module Zavudev
  module Models
    class SenderUpdateProfileParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SenderUpdateProfileParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :sender_id

      # Short description of the business (max 139 characters).
      sig { returns(T.nilable(String)) }
      attr_reader :about

      sig { params(about: String).void }
      attr_writer :about

      # Physical address of the business (max 256 characters).
      sig { returns(T.nilable(String)) }
      attr_reader :address

      sig { params(address: String).void }
      attr_writer :address

      # Extended description of the business (max 512 characters).
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Business email address.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Business category for WhatsApp Business profile.
      sig do
        returns(T.nilable(Zavudev::WhatsappBusinessProfileVertical::OrSymbol))
      end
      attr_reader :vertical

      sig do
        params(
          vertical: Zavudev::WhatsappBusinessProfileVertical::OrSymbol
        ).void
      end
      attr_writer :vertical

      # Business website URLs (maximum 2).
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :websites

      sig { params(websites: T::Array[String]).void }
      attr_writer :websites

      sig do
        params(
          sender_id: String,
          about: String,
          address: String,
          description: String,
          email: String,
          vertical: Zavudev::WhatsappBusinessProfileVertical::OrSymbol,
          websites: T::Array[String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        sender_id:,
        # Short description of the business (max 139 characters).
        about: nil,
        # Physical address of the business (max 256 characters).
        address: nil,
        # Extended description of the business (max 512 characters).
        description: nil,
        # Business email address.
        email: nil,
        # Business category for WhatsApp Business profile.
        vertical: nil,
        # Business website URLs (maximum 2).
        websites: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            sender_id: String,
            about: String,
            address: String,
            description: String,
            email: String,
            vertical: Zavudev::WhatsappBusinessProfileVertical::OrSymbol,
            websites: T::Array[String],
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
