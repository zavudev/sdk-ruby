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

      # @!attribute referral
      #   Click-to-WhatsApp (CTWA) ad attribution: where an inbound conversation came
      #   from.
      #
      #   WhatsApp only. Present on the **first inbound message** of a conversation opened
      #   from a Meta ad or post, and on no message after it — so store it when it arrives
      #   rather than expecting it again. Organic conversations never carry it.
      #
      #   Field names are camelCased to match the rest of this API; Meta sends them as
      #   snake_case (`ctwa_clid`, `source_id`, ...). Fields that do not apply are
      #   omitted: a `post` source has no click id, and an image ad has no `videoUrl`.
      #
      #   @return [Zavudev::Models::MessageContent::Referral, nil]
      optional :referral, -> { Zavudev::MessageContent::Referral }

      # @!attribute reply_to_from
      #   Sender of the quoted message (phone number in E.164 format).
      #
      #   @return [String, nil]
      optional :reply_to_from, String, api_name: :replyToFrom

      # @!attribute reply_to_message_id
      #   Zavu message ID of the quoted message this message replies to. Present on
      #   inbound messages that quote an earlier message. Omitted when the quoted message
      #   is not found in Zavu (e.g. an old or unknown message) — use
      #   replyToProviderMessageId in that case.
      #
      #   @return [String, nil]
      optional :reply_to_message_id, String, api_name: :replyToMessageId

      # @!attribute reply_to_message_type
      #   Type of the quoted message (text, image, video, etc.).
      #
      #   @return [String, nil]
      optional :reply_to_message_type, String, api_name: :replyToMessageType

      # @!attribute reply_to_provider_message_id
      #   Provider message ID (WhatsApp WAMID) of the quoted message. Present whenever an
      #   inbound message is a reply, even if the quoted message is not stored in Zavu.
      #
      #   @return [String, nil]
      optional :reply_to_provider_message_id, String, api_name: :replyToProviderMessageId

      # @!attribute reply_to_text
      #   Truncated snippet of the quoted message's text, for display. Empty when the
      #   quoted message has no text (e.g. media).
      #
      #   @return [String, nil]
      optional :reply_to_text, String, api_name: :replyToText

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

      # @!attribute template_header_variables
      #   Value for a text-header variable, keyed by `1` (WhatsApp text headers allow at
      #   most one variable). Optional override. If omitted, Zavu resolves the header from
      #   `templateVariables` using the header placeholder's name (e.g. `novios`). Static
      #   text headers need no value.
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
      #   Variables for body placeholders. Key them to match the template body: by
      #   position (`1`, `2`, ...) for positional templates, or by name (e.g.
      #   `customer_name`) for named templates. Zavu detects the template's format and
      #   sends the correct payload to Meta. Named keys also resolve a named text-header
      #   variable. Do not mix positional and named keys in the same request.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

      # @!method initialize(buttons: nil, contacts: nil, cta_display_text: nil, cta_header_media_url: nil, cta_header_text: nil, cta_header_type: nil, cta_url: nil, emoji: nil, filename: nil, footer_text: nil, latitude: nil, list_button: nil, location_address: nil, location_name: nil, longitude: nil, media_id: nil, media_url: nil, mime_type: nil, react_to_message_id: nil, referral: nil, reply_to_from: nil, reply_to_message_id: nil, reply_to_message_type: nil, reply_to_provider_message_id: nil, reply_to_text: nil, sections: nil, template_button_variables: nil, template_header_variables: nil, template_id: nil, template_variables: nil)
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
      #   @param referral [Zavudev::Models::MessageContent::Referral] Click-to-WhatsApp (CTWA) ad attribution: where an inbound conversation came from
      #
      #   @param reply_to_from [String] Sender of the quoted message (phone number in E.164 format).
      #
      #   @param reply_to_message_id [String] Zavu message ID of the quoted message this message replies to. Present on inboun
      #
      #   @param reply_to_message_type [String] Type of the quoted message (text, image, video, etc.).
      #
      #   @param reply_to_provider_message_id [String] Provider message ID (WhatsApp WAMID) of the quoted message. Present whenever an
      #
      #   @param reply_to_text [String] Truncated snippet of the quoted message's text, for display. Empty when the quot
      #
      #   @param sections [Array<Zavudev::Models::MessageContent::Section>] Sections for list messages.
      #
      #   @param template_button_variables [Hash{Symbol=>String}] Variables for dynamic button placeholders (URL buttons and OTP buttons). Keys ar
      #
      #   @param template_header_variables [Hash{Symbol=>String}] Value for a text-header variable, keyed by `1` (WhatsApp text headers allow at m
      #
      #   @param template_id [String] Template ID for template messages.
      #
      #   @param template_variables [Hash{Symbol=>String}] Variables for body placeholders. Key them to match the template body: by positio

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

      # @see Zavudev::Models::MessageContent#referral
      class Referral < Zavudev::Internal::Type::BaseModel
        # @!attribute body
        #   Body copy of the ad or post.
        #
        #   @return [String, nil]
        optional :body, String

        # @!attribute ctwa_clid
        #   Click-to-WhatsApp click identifier. This is the value Meta's Conversions API
        #   needs to credit a conversion back to the ad that produced the conversation.
        #   Present on `ad` sources; a `post` source has none.
        #
        #   @return [String, nil]
        optional :ctwa_clid, String, api_name: :ctwaClid

        # @!attribute headline
        #   Headline of the ad or post.
        #
        #   @return [String, nil]
        optional :headline, String

        # @!attribute image_url
        #   Image of the ad. Present when `mediaType` is `image`.
        #
        #   @return [String, nil]
        optional :image_url, String, api_name: :imageUrl

        # @!attribute media_type
        #   Type of media on the ad, when it had any.
        #
        #   @return [Symbol, Zavudev::Models::MessageContent::Referral::MediaType, nil]
        optional :media_type, enum: -> { Zavudev::MessageContent::Referral::MediaType }, api_name: :mediaType

        # @!attribute source_id
        #   Identifier of the ad or post that produced the click.
        #
        #   @return [String, nil]
        optional :source_id, String, api_name: :sourceId

        # @!attribute source_type
        #   Where the click came from.
        #
        #   @return [Symbol, Zavudev::Models::MessageContent::Referral::SourceType, nil]
        optional :source_type,
                 enum: -> {
                   Zavudev::MessageContent::Referral::SourceType
                 },
                 api_name: :sourceType

        # @!attribute source_url
        #   Meta permalink to the ad or post.
        #
        #   @return [String, nil]
        optional :source_url, String, api_name: :sourceUrl

        # @!attribute thumbnail_url
        #   Thumbnail of the ad media.
        #
        #   @return [String, nil]
        optional :thumbnail_url, String, api_name: :thumbnailUrl

        # @!attribute video_url
        #   Video of the ad. Present when `mediaType` is `video`.
        #
        #   @return [String, nil]
        optional :video_url, String, api_name: :videoUrl

        # @!method initialize(body: nil, ctwa_clid: nil, headline: nil, image_url: nil, media_type: nil, source_id: nil, source_type: nil, source_url: nil, thumbnail_url: nil, video_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::MessageContent::Referral} for more details.
        #
        #   Click-to-WhatsApp (CTWA) ad attribution: where an inbound conversation came
        #   from.
        #
        #   WhatsApp only. Present on the **first inbound message** of a conversation opened
        #   from a Meta ad or post, and on no message after it — so store it when it arrives
        #   rather than expecting it again. Organic conversations never carry it.
        #
        #   Field names are camelCased to match the rest of this API; Meta sends them as
        #   snake_case (`ctwa_clid`, `source_id`, ...). Fields that do not apply are
        #   omitted: a `post` source has no click id, and an image ad has no `videoUrl`.
        #
        #   @param body [String] Body copy of the ad or post.
        #
        #   @param ctwa_clid [String] Click-to-WhatsApp click identifier. This is the value Meta's Conversions API nee
        #
        #   @param headline [String] Headline of the ad or post.
        #
        #   @param image_url [String] Image of the ad. Present when `mediaType` is `image`.
        #
        #   @param media_type [Symbol, Zavudev::Models::MessageContent::Referral::MediaType] Type of media on the ad, when it had any.
        #
        #   @param source_id [String] Identifier of the ad or post that produced the click.
        #
        #   @param source_type [Symbol, Zavudev::Models::MessageContent::Referral::SourceType] Where the click came from.
        #
        #   @param source_url [String] Meta permalink to the ad or post.
        #
        #   @param thumbnail_url [String] Thumbnail of the ad media.
        #
        #   @param video_url [String] Video of the ad. Present when `mediaType` is `video`.

        # Type of media on the ad, when it had any.
        #
        # @see Zavudev::Models::MessageContent::Referral#media_type
        module MediaType
          extend Zavudev::Internal::Type::Enum

          IMAGE = :image
          VIDEO = :video

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Where the click came from.
        #
        # @see Zavudev::Models::MessageContent::Referral#source_type
        module SourceType
          extend Zavudev::Internal::Type::Enum

          AD = :ad
          POST = :post

          # @!method self.values
          #   @return [Array<Symbol>]
        end
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
