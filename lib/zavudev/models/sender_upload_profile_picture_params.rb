# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#upload_profile_picture
    class SenderUploadProfilePictureParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute sender_id
      #
      #   @return [String]
      required :sender_id, String

      # @!attribute image_url
      #   URL of the image to upload.
      #
      #   @return [String]
      required :image_url, String, api_name: :imageUrl

      # @!attribute mime_type
      #   MIME type of the image.
      #
      #   @return [Symbol, Zavudev::Models::SenderUploadProfilePictureParams::MimeType]
      required :mime_type,
               enum: -> {
                 Zavudev::SenderUploadProfilePictureParams::MimeType
               },
               api_name: :mimeType

      # @!method initialize(sender_id:, image_url:, mime_type:, request_options: {})
      #   @param sender_id [String]
      #
      #   @param image_url [String] URL of the image to upload.
      #
      #   @param mime_type [Symbol, Zavudev::Models::SenderUploadProfilePictureParams::MimeType] MIME type of the image.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # MIME type of the image.
      module MimeType
        extend Zavudev::Internal::Type::Enum

        IMAGE_JPEG = :"image/jpeg"
        IMAGE_PNG = :"image/png"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
