# typed: strong

module Zavudev
  module Models
    class WhatsappBusinessProfile < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::WhatsappBusinessProfile, Zavudev::Internal::AnyHash)
        end

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

      # URL of the business profile picture.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture_url

      sig { params(profile_picture_url: String).void }
      attr_writer :profile_picture_url

      # Business category for WhatsApp Business profile.
      sig do
        returns(
          T.nilable(Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
        )
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

      # WhatsApp Business profile information.
      sig do
        params(
          about: String,
          address: String,
          description: String,
          email: String,
          profile_picture_url: String,
          vertical: Zavudev::WhatsappBusinessProfileVertical::OrSymbol,
          websites: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Short description of the business (max 139 characters).
        about: nil,
        # Physical address of the business (max 256 characters).
        address: nil,
        # Extended description of the business (max 512 characters).
        description: nil,
        # Business email address.
        email: nil,
        # URL of the business profile picture.
        profile_picture_url: nil,
        # Business category for WhatsApp Business profile.
        vertical: nil,
        # Business website URLs (maximum 2).
        websites: nil
      )
      end

      sig do
        override.returns(
          {
            about: String,
            address: String,
            description: String,
            email: String,
            profile_picture_url: String,
            vertical: Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol,
            websites: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
