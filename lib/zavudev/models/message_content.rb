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

      # @!attribute template_id
      #   Template ID for template messages.
      #
      #   @return [String, nil]
      optional :template_id, String, api_name: :templateId

      # @!attribute template_variables
      #   Variables for template rendering. Keys are variable positions (1, 2, 3...).
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

      # @!method initialize(buttons: nil, contacts: nil, emoji: nil, filename: nil, latitude: nil, list_button: nil, location_address: nil, location_name: nil, longitude: nil, media_id: nil, media_url: nil, mime_type: nil, react_to_message_id: nil, sections: nil, template_id: nil, template_variables: nil)
      #   Content for non-text message types (WhatsApp and Telegram).
      #
      #   @param buttons [Array<Zavudev::Models::MessageContent::Button>] Interactive buttons (max 3).
      #
      #   @param contacts [Array<Zavudev::Models::MessageContent::Contact>] Contact cards for contact messages.
      #
      #   @param emoji [String] Emoji for reaction messages.
      #
      #   @param filename [String] Filename for documents.
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
      #   @param template_id [String] Template ID for template messages.
      #
      #   @param template_variables [Hash{Symbol=>String}] Variables for template rendering. Keys are variable positions (1, 2, 3...).

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
