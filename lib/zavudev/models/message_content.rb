# frozen_string_literal: true

module Zavudev
  module Models
    class MessageContent < Zavudev::Internal::Type::BaseModel
      # @!attribute buttons
      #   Interactive buttons (max 3).
      #
      #   @return [Array<Zavudev::Models::MessageContent::Button>, nil]
      optional :buttons, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::MessageContent::Button] }

      # @!attribute contacts
      #   Contact cards for contact messages.
      #
      #   @return [Array<Zavudev::Models::MessageContent::Contact>, nil]
      optional :contacts, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::MessageContent::Contact] }

      # @!attribute cta_display_text
      #   Button label for cta_url messages.
      #
      #   @return [String, nil]
      optional :cta_display_text, String, api_name: :ctaDisplayText

      # @!attribute cta_header_media_url
      #   Public HTTPS URL of the header media when ctaHeaderType is 'image', 'video', or
      #   'document'. WhatsApp fetches this URL — it must be publicly reachable and return
      #   the declared content type.
      #
      #   @return [String, nil]
      optional :cta_header_media_url, String, api_name: :ctaHeaderMediaUrl

      # @!attribute cta_header_text
      #   Header text when ctaHeaderType is 'text'.
      #
      #   @return [String, nil]
      optional :cta_header_text, String, api_name: :ctaHeaderText

      # @!attribute cta_header_type
      #   Optional header type for cta_url messages.
      #
      #   @return [Symbol, Zavudev::Models::MessageContent::CtaHeaderType, nil]
      optional :cta_header_type, enum: -> { Zavudev::MessageContent::CtaHeaderType }, api_name: :ctaHeaderType

      # @!attribute cta_url
      #   Destination URL opened in the device's default browser when the button is
      #   tapped. Used with messageType=cta_url. WhatsApp requires HTTPS in production.
      #
      #   @return [String, nil]
      optional :cta_url, String, api_name: :ctaUrl

      # @!attribute emoji
      #   Emoji for reaction messages.
      #
      #   @return [String, nil]
      optional :emoji, String

      # @!attribute filename
      #   Filename for documents.
      #
      #   @return [String, nil]
      optional :filename, String

      # @!attribute footer_text
      #   Optional footer text for cta_url messages.
      #
      #   @return [String, nil]
      optional :footer_text, String, api_name: :footerText

      # @!attribute latitude
      #   Latitude for location messages.
      #
      #   @return [Float, nil]
      optional :latitude, Float

      # @!attribute list_button
      #   Button text for list messages.
      #
      #   @return [String, nil]
      optional :list_button, String, api_name: :listButton

      # @!attribute location_address
      #   Address of the location.
      #
      #   @return [String, nil]
      optional :location_address, String, api_name: :locationAddress

      # @!attribute location_name
      #   Name of the location.
      #
      #   @return [String, nil]
      optional :location_name, String, api_name: :locationName

      # @!attribute longitude
      #   Longitude for location messages.
      #
      #   @return [Float, nil]
      optional :longitude, Float

      # @!attribute media_id
      #   WhatsApp media ID if already uploaded.
      #
      #   @return [String, nil]
      optional :media_id, String, api_name: :mediaId

      # @!attribute media_url
      #   URL of the media file (for image, video, audio, document, sticker).
      #
      #   @return [String, nil]
      optional :media_url, String, api_name: :mediaUrl

      # @!attribute mime_type
      #   MIME type of the media.
      #
      #   @return [String, nil]
      optional :mime_type, String, api_name: :mimeType

      # @!attribute react_to_message_id
      #   Message ID to react to.
      #
      #   @return [String, nil]
      optional :react_to_message_id, String, api_name: :reactToMessageId

      # @!attribute sections
      #   Sections for list messages.
      #
      #   @return [Array<Zavudev::Models::MessageContent::Section>, nil]
      optional :sections, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::MessageContent::Section] }

      # @!attribute template_button_variables
      #   Variables for dynamic button placeholders (URL buttons and OTP buttons). Keys
      #   are the button index (0, 1, 2) in the template's `buttons` array — not the
      #   placeholder name. Values substitute the `{{1}}` placeholder inside that button's
      #   URL.
      #
      #   **WhatsApp constraints:**
      #
      #   - URL buttons only accept `{{1}}` — positional, numeric, no whitespace, no name.
      #     Named placeholders like `{{token}}` are stored as literal URL text by Meta and
      #     cannot be substituted.
      #   - At most one placeholder per URL button.
      #   - A template may have at most three buttons.
      #   - Static URL buttons (no placeholder) and `quick_reply` buttons are not included
      #     here.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_button_variables,
               Zavudev::Internal::Type::HashOf[String],
               api_name: :templateButtonVariables

      # @!attribute template_id
      #   Template ID for template messages.
      #
      #   @return [String, nil]
      optional :template_id, String, api_name: :templateId

      # @!attribute template_variables
      #   Variables for body placeholders. Keys are positions (1, 2, 3, ...) matching the
      #   order placeholders appear in the template body.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

      # @!method initialize(buttons: nil, contacts: nil, cta_display_text: nil, cta_header_media_url: nil, cta_header_text: nil, cta_header_type: nil, cta_url: nil, emoji: nil, filename: nil, footer_text: nil, latitude: nil, list_button: nil, location_address: nil, location_name: nil, longitude: nil, media_id: nil, media_url: nil, mime_type: nil, react_to_message_id: nil, sections: nil, template_button_variables: nil, template_id: nil, template_variables: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::MessageContent} for more details.
      #
      #   Content for non-text message types (WhatsApp and Telegram).
      #
      #   @param buttons [Array<Zavudev::Models::MessageContent::Button>] Interactive buttons (max 3).
      #
      #   @param contacts [Array<Zavudev::Models::MessageContent::Contact>] Contact cards for contact messages.
      #
      #   @param cta_display_text [String] Button label for cta_url messages.
      #
      #   @param cta_header_media_url [String] Public HTTPS URL of the header media when ctaHeaderType is 'image', 'video', or
      #
      #   @param cta_header_text [String] Header text when ctaHeaderType is 'text'.
      #
      #   @param cta_header_type [Symbol, Zavudev::Models::MessageContent::CtaHeaderType] Optional header type for cta_url messages.
      #
      #   @param cta_url [String] Destination URL opened in the device's default browser when the button is tapped
      #
      #   @param emoji [String] Emoji for reaction messages.
      #
      #   @param filename [String] Filename for documents.
      #
      #   @param footer_text [String] Optional footer text for cta_url messages.
      #
      #   @param latitude [Float] Latitude for location messages.
      #
      #   @param list_button [String] Button text for list messages.
      #
      #   @param location_address [String] Address of the location.
      #
      #   @param location_name [String] Name of the location.
      #
      #   @param longitude [Float] Longitude for location messages.
      #
      #   @param media_id [String] WhatsApp media ID if already uploaded.
      #
      #   @param media_url [String] URL of the media file (for image, video, audio, document, sticker).
      #
      #   @param mime_type [String] MIME type of the media.
      #
      #   @param react_to_message_id [String] Message ID to react to.
      #
      #   @param sections [Array<Zavudev::Models::MessageContent::Section>] Sections for list messages.
      #
      #   @param template_button_variables [Hash{Symbol=>String}] Variables for dynamic button placeholders (URL buttons and OTP buttons). Keys ar
      #
      #   @param template_id [String] Template ID for template messages.
      #
      #   @param template_variables [Hash{Symbol=>String}] Variables for body placeholders. Keys are positions (1, 2, 3, ...) matching the

      class Button < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!method initialize(id:, title:)
        #   @param id [String]
        #   @param title [String]
      end

      class Contact < Zavudev::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute phones
        #
        #   @return [Array<String>, nil]
        optional :phones, Zavudev::Internal::Type::ArrayOf[String]

        # @!method initialize(name: nil, phones: nil)
        #   @param name [String]
        #   @param phones [Array<String>]
      end

      # Optional header type for cta_url messages.
      #
      # @see Zavudev::Models::MessageContent#cta_header_type
      module CtaHeaderType
        extend Zavudev::Internal::Type::Enum

        TEXT = :text
        IMAGE = :image
        VIDEO = :video
        DOCUMENT = :document

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Section < Zavudev::Internal::Type::BaseModel
        # @!attribute rows
        #
        #   @return [Array<Zavudev::Models::MessageContent::Section::Row>]
        required :rows, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::MessageContent::Section::Row] }

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!method initialize(rows:, title:)
        #   @param rows [Array<Zavudev::Models::MessageContent::Section::Row>]
        #   @param title [String]

        class Row < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute title
          #
          #   @return [String]
          required :title, String

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!method initialize(id:, title:, description: nil)
          #   @param id [String]
          #   @param title [String]
          #   @param description [String]
        end
      end
    end
  end
end
