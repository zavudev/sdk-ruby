# frozen_string_literal: true

module Zavudev
  module Models
    class BroadcastContent < Zavudev::Internal::Type::BaseModel
      # @!attribute filename
      #   Filename for documents.
      #
      #   @return [String, nil]
      optional :filename, String

      # @!attribute media_id
      #   Media ID if already uploaded.
      #
      #   @return [String, nil]
      optional :media_id, String, api_name: :mediaId

      # @!attribute media_url
      #   URL of the media file.
      #
      #   @return [String, nil]
      optional :media_url, String, api_name: :mediaUrl

      # @!attribute mime_type
      #   MIME type of the media.
      #
      #   @return [String, nil]
      optional :mime_type, String, api_name: :mimeType

      # @!attribute template_id
      #   Template ID for template messages.
      #
      #   @return [String, nil]
      optional :template_id, String, api_name: :templateId

      # @!attribute template_variables
      #   Default template variables (can be overridden per contact).
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

      # @!method initialize(filename: nil, media_id: nil, media_url: nil, mime_type: nil, template_id: nil, template_variables: nil)
      #   Content for non-text broadcast message types.
      #
      #   @param filename [String] Filename for documents.
      #
      #   @param media_id [String] Media ID if already uploaded.
      #
      #   @param media_url [String] URL of the media file.
      #
      #   @param mime_type [String] MIME type of the media.
      #
      #   @param template_id [String] Template ID for template messages.
      #
      #   @param template_variables [Hash{Symbol=>String}] Default template variables (can be overridden per contact).
    end
  end
end
