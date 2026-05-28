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

      # @!attribute template_button_variables
      #   Default button variables for dynamic URL/OTP buttons. Keys are the button index
      #   (0, 1, 2). Per-contact values override these.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_button_variables,
               Zavudev::Internal::Type::HashOf[String],
               api_name: :templateButtonVariables

      # @!attribute template_header_variables
      #   Default value for a text-header variable, keyed by `1` (can be overridden per
      #   contact). If omitted, Zavu resolves the header from `templateVariables` by the
      #   header placeholder's name.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_header_variables,
               Zavudev::Internal::Type::HashOf[String],
               api_name: :templateHeaderVariables

      # @!attribute template_id
      #   Template ID for template messages.
      #
      #   @return [String, nil]
      optional :template_id, String, api_name: :templateId

      # @!attribute template_variables
      #   Default body variables (can be overridden per contact). Key them to match the
      #   template body: by position (`1`, `2`, ...) for positional templates, or by name
      #   (e.g. `customer_name`) for named templates. Zavu detects the template's format
      #   and sends the correct payload to Meta. Do not mix positional and named keys.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

      # @!method initialize(filename: nil, media_id: nil, media_url: nil, mime_type: nil, template_button_variables: nil, template_header_variables: nil, template_id: nil, template_variables: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::BroadcastContent} for more details.
      #
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
      #   @param template_button_variables [Hash{Symbol=>String}] Default button variables for dynamic URL/OTP buttons. Keys are the button index
      #
      #   @param template_header_variables [Hash{Symbol=>String}] Default value for a text-header variable, keyed by `1` (can be overridden per co
      #
      #   @param template_id [String] Template ID for template messages.
      #
      #   @param template_variables [Hash{Symbol=>String}] Default body variables (can be overridden per contact). Key them to match the te
    end
  end
end
