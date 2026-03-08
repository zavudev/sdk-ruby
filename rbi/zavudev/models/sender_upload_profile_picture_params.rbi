# typed: strong

module Zavudev
  module Models
    class SenderUploadProfilePictureParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::SenderUploadProfilePictureParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :sender_id

      # URL of the image to upload.
      sig { returns(String) }
      attr_accessor :image_url

      # MIME type of the image.
      sig do
        returns(Zavudev::SenderUploadProfilePictureParams::MimeType::OrSymbol)
      end
      attr_accessor :mime_type

      sig do
        params(
          sender_id: String,
          image_url: String,
          mime_type:
            Zavudev::SenderUploadProfilePictureParams::MimeType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        sender_id:,
        # URL of the image to upload.
        image_url:,
        # MIME type of the image.
        mime_type:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            sender_id: String,
            image_url: String,
            mime_type:
              Zavudev::SenderUploadProfilePictureParams::MimeType::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # MIME type of the image.
      module MimeType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::SenderUploadProfilePictureParams::MimeType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGE_JPEG =
          T.let(
            :"image/jpeg",
            Zavudev::SenderUploadProfilePictureParams::MimeType::TaggedSymbol
          )
        IMAGE_PNG =
          T.let(
            :"image/png",
            Zavudev::SenderUploadProfilePictureParams::MimeType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Zavudev::SenderUploadProfilePictureParams::MimeType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
