# typed: strong

module Zavudev
  module Models
    class MessageContent < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageContent, Zavudev::Internal::AnyHash)
        end

      # Interactive buttons (max 3).
      sig { returns(T.nilable(T::Array[Zavudev::MessageContent::Button])) }
      attr_reader :buttons

      sig do
        params(buttons: T::Array[Zavudev::MessageContent::Button::OrHash]).void
      end
      attr_writer :buttons

      # Contact cards for contact messages.
      sig { returns(T.nilable(T::Array[Zavudev::MessageContent::Contact])) }
      attr_reader :contacts

      sig do
        params(
          contacts: T::Array[Zavudev::MessageContent::Contact::OrHash]
        ).void
      end
      attr_writer :contacts

      # Button label for cta_url messages.
      sig { returns(T.nilable(String)) }
      attr_reader :cta_display_text

      sig { params(cta_display_text: String).void }
      attr_writer :cta_display_text

      # Public HTTPS URL of the header media when ctaHeaderType is 'image', 'video', or
      # 'document'. WhatsApp fetches this URL — it must be publicly reachable and return
      # the declared content type.
      sig { returns(T.nilable(String)) }
      attr_reader :cta_header_media_url

      sig { params(cta_header_media_url: String).void }
      attr_writer :cta_header_media_url

      # Header text when ctaHeaderType is 'text'.
      sig { returns(T.nilable(String)) }
      attr_reader :cta_header_text

      sig { params(cta_header_text: String).void }
      attr_writer :cta_header_text

      # Optional header type for cta_url messages.
      sig do
        returns(T.nilable(Zavudev::MessageContent::CtaHeaderType::OrSymbol))
      end
      attr_reader :cta_header_type

      sig do
        params(
          cta_header_type: Zavudev::MessageContent::CtaHeaderType::OrSymbol
        ).void
      end
      attr_writer :cta_header_type

      # Destination URL opened in the device's default browser when the button is
      # tapped. Used with messageType=cta_url. WhatsApp requires HTTPS in production.
      sig { returns(T.nilable(String)) }
      attr_reader :cta_url

      sig { params(cta_url: String).void }
      attr_writer :cta_url

      # Emoji for reaction messages.
      sig { returns(T.nilable(String)) }
      attr_reader :emoji

      sig { params(emoji: String).void }
      attr_writer :emoji

      # Filename for documents.
      sig { returns(T.nilable(String)) }
      attr_reader :filename

      sig { params(filename: String).void }
      attr_writer :filename

      # Optional footer text for cta_url messages.
      sig { returns(T.nilable(String)) }
      attr_reader :footer_text

      sig { params(footer_text: String).void }
      attr_writer :footer_text

      # Latitude for location messages.
      sig { returns(T.nilable(Float)) }
      attr_reader :latitude

      sig { params(latitude: Float).void }
      attr_writer :latitude

      # Button text for list messages.
      sig { returns(T.nilable(String)) }
      attr_reader :list_button

      sig { params(list_button: String).void }
      attr_writer :list_button

      # Address of the location.
      sig { returns(T.nilable(String)) }
      attr_reader :location_address

      sig { params(location_address: String).void }
      attr_writer :location_address

      # Name of the location.
      sig { returns(T.nilable(String)) }
      attr_reader :location_name

      sig { params(location_name: String).void }
      attr_writer :location_name

      # Longitude for location messages.
      sig { returns(T.nilable(Float)) }
      attr_reader :longitude

      sig { params(longitude: Float).void }
      attr_writer :longitude

      # WhatsApp media ID if already uploaded.
      sig { returns(T.nilable(String)) }
      attr_reader :media_id

      sig { params(media_id: String).void }
      attr_writer :media_id

      # URL of the media file (for image, video, audio, document, sticker).
      sig { returns(T.nilable(String)) }
      attr_reader :media_url

      sig { params(media_url: String).void }
      attr_writer :media_url

      # MIME type of the media.
      sig { returns(T.nilable(String)) }
      attr_reader :mime_type

      sig { params(mime_type: String).void }
      attr_writer :mime_type

      # Message ID to react to.
      sig { returns(T.nilable(String)) }
      attr_reader :react_to_message_id

      sig { params(react_to_message_id: String).void }
      attr_writer :react_to_message_id

      # Sender of the quoted message (phone number in E.164 format).
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to_from

      sig { params(reply_to_from: String).void }
      attr_writer :reply_to_from

      # Zavu message ID of the quoted message this message replies to. Present on
      # inbound messages that quote an earlier message. Omitted when the quoted message
      # is not found in Zavu (e.g. an old or unknown message) — use
      # replyToProviderMessageId in that case.
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to_message_id

      sig { params(reply_to_message_id: String).void }
      attr_writer :reply_to_message_id

      # Type of the quoted message (text, image, video, etc.).
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to_message_type

      sig { params(reply_to_message_type: String).void }
      attr_writer :reply_to_message_type

      # Provider message ID (WhatsApp WAMID) of the quoted message. Present whenever an
      # inbound message is a reply, even if the quoted message is not stored in Zavu.
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to_provider_message_id

      sig { params(reply_to_provider_message_id: String).void }
      attr_writer :reply_to_provider_message_id

      # Truncated snippet of the quoted message's text, for display. Empty when the
      # quoted message has no text (e.g. media).
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to_text

      sig { params(reply_to_text: String).void }
      attr_writer :reply_to_text

      # Sections for list messages.
      sig { returns(T.nilable(T::Array[Zavudev::MessageContent::Section])) }
      attr_reader :sections

      sig do
        params(
          sections: T::Array[Zavudev::MessageContent::Section::OrHash]
        ).void
      end
      attr_writer :sections

      # Variables for dynamic button placeholders (URL buttons and OTP buttons). Keys
      # are the button index (0, 1, 2) in the template's `buttons` array — not the
      # placeholder name. Values substitute the `{{1}}` placeholder inside that button's
      # URL.
      #
      # **WhatsApp constraints:**
      #
      # - URL buttons only accept `{{1}}` — positional, numeric, no whitespace, no name.
      #   Named placeholders like `{{token}}` are stored as literal URL text by Meta and
      #   cannot be substituted.
      # - At most one placeholder per URL button.
      # - A template may have at most three buttons.
      # - Static URL buttons (no placeholder) and `quick_reply` buttons are not included
      #   here.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_button_variables

      sig { params(template_button_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_button_variables

      # Value for a text-header variable, keyed by `1` (WhatsApp text headers allow at
      # most one variable). Optional override. If omitted, Zavu resolves the header from
      # `templateVariables` using the header placeholder's name (e.g. `novios`). Static
      # text headers need no value.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_header_variables

      sig { params(template_header_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_header_variables

      # Template ID for template messages.
      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      # Variables for body placeholders. Key them to match the template body: by
      # position (`1`, `2`, ...) for positional templates, or by name (e.g.
      # `customer_name`) for named templates. Zavu detects the template's format and
      # sends the correct payload to Meta. Named keys also resolve a named text-header
      # variable. Do not mix positional and named keys in the same request.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_variables

      sig { params(template_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_variables

      # Content for non-text message types (WhatsApp and Telegram).
      sig do
        params(
          buttons: T::Array[Zavudev::MessageContent::Button::OrHash],
          contacts: T::Array[Zavudev::MessageContent::Contact::OrHash],
          cta_display_text: String,
          cta_header_media_url: String,
          cta_header_text: String,
          cta_header_type: Zavudev::MessageContent::CtaHeaderType::OrSymbol,
          cta_url: String,
          emoji: String,
          filename: String,
          footer_text: String,
          latitude: Float,
          list_button: String,
          location_address: String,
          location_name: String,
          longitude: Float,
          media_id: String,
          media_url: String,
          mime_type: String,
          react_to_message_id: String,
          reply_to_from: String,
          reply_to_message_id: String,
          reply_to_message_type: String,
          reply_to_provider_message_id: String,
          reply_to_text: String,
          sections: T::Array[Zavudev::MessageContent::Section::OrHash],
          template_button_variables: T::Hash[Symbol, String],
          template_header_variables: T::Hash[Symbol, String],
          template_id: String,
          template_variables: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Interactive buttons (max 3).
        buttons: nil,
        # Contact cards for contact messages.
        contacts: nil,
        # Button label for cta_url messages.
        cta_display_text: nil,
        # Public HTTPS URL of the header media when ctaHeaderType is 'image', 'video', or
        # 'document'. WhatsApp fetches this URL — it must be publicly reachable and return
        # the declared content type.
        cta_header_media_url: nil,
        # Header text when ctaHeaderType is 'text'.
        cta_header_text: nil,
        # Optional header type for cta_url messages.
        cta_header_type: nil,
        # Destination URL opened in the device's default browser when the button is
        # tapped. Used with messageType=cta_url. WhatsApp requires HTTPS in production.
        cta_url: nil,
        # Emoji for reaction messages.
        emoji: nil,
        # Filename for documents.
        filename: nil,
        # Optional footer text for cta_url messages.
        footer_text: nil,
        # Latitude for location messages.
        latitude: nil,
        # Button text for list messages.
        list_button: nil,
        # Address of the location.
        location_address: nil,
        # Name of the location.
        location_name: nil,
        # Longitude for location messages.
        longitude: nil,
        # WhatsApp media ID if already uploaded.
        media_id: nil,
        # URL of the media file (for image, video, audio, document, sticker).
        media_url: nil,
        # MIME type of the media.
        mime_type: nil,
        # Message ID to react to.
        react_to_message_id: nil,
        # Sender of the quoted message (phone number in E.164 format).
        reply_to_from: nil,
        # Zavu message ID of the quoted message this message replies to. Present on
        # inbound messages that quote an earlier message. Omitted when the quoted message
        # is not found in Zavu (e.g. an old or unknown message) — use
        # replyToProviderMessageId in that case.
        reply_to_message_id: nil,
        # Type of the quoted message (text, image, video, etc.).
        reply_to_message_type: nil,
        # Provider message ID (WhatsApp WAMID) of the quoted message. Present whenever an
        # inbound message is a reply, even if the quoted message is not stored in Zavu.
        reply_to_provider_message_id: nil,
        # Truncated snippet of the quoted message's text, for display. Empty when the
        # quoted message has no text (e.g. media).
        reply_to_text: nil,
        # Sections for list messages.
        sections: nil,
        # Variables for dynamic button placeholders (URL buttons and OTP buttons). Keys
        # are the button index (0, 1, 2) in the template's `buttons` array — not the
        # placeholder name. Values substitute the `{{1}}` placeholder inside that button's
        # URL.
        #
        # **WhatsApp constraints:**
        #
        # - URL buttons only accept `{{1}}` — positional, numeric, no whitespace, no name.
        #   Named placeholders like `{{token}}` are stored as literal URL text by Meta and
        #   cannot be substituted.
        # - At most one placeholder per URL button.
        # - A template may have at most three buttons.
        # - Static URL buttons (no placeholder) and `quick_reply` buttons are not included
        #   here.
        template_button_variables: nil,
        # Value for a text-header variable, keyed by `1` (WhatsApp text headers allow at
        # most one variable). Optional override. If omitted, Zavu resolves the header from
        # `templateVariables` using the header placeholder's name (e.g. `novios`). Static
        # text headers need no value.
        template_header_variables: nil,
        # Template ID for template messages.
        template_id: nil,
        # Variables for body placeholders. Key them to match the template body: by
        # position (`1`, `2`, ...) for positional templates, or by name (e.g.
        # `customer_name`) for named templates. Zavu detects the template's format and
        # sends the correct payload to Meta. Named keys also resolve a named text-header
        # variable. Do not mix positional and named keys in the same request.
        template_variables: nil
      )
      end

      sig do
        override.returns(
          {
            buttons: T::Array[Zavudev::MessageContent::Button],
            contacts: T::Array[Zavudev::MessageContent::Contact],
            cta_display_text: String,
            cta_header_media_url: String,
            cta_header_text: String,
            cta_header_type: Zavudev::MessageContent::CtaHeaderType::OrSymbol,
            cta_url: String,
            emoji: String,
            filename: String,
            footer_text: String,
            latitude: Float,
            list_button: String,
            location_address: String,
            location_name: String,
            longitude: Float,
            media_id: String,
            media_url: String,
            mime_type: String,
            react_to_message_id: String,
            reply_to_from: String,
            reply_to_message_id: String,
            reply_to_message_type: String,
            reply_to_provider_message_id: String,
            reply_to_text: String,
            sections: T::Array[Zavudev::MessageContent::Section],
            template_button_variables: T::Hash[Symbol, String],
            template_header_variables: T::Hash[Symbol, String],
            template_id: String,
            template_variables: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end

      class Button < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::MessageContent::Button, Zavudev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :title

        sig { params(id: String, title: String).returns(T.attached_class) }
        def self.new(id:, title:)
        end

        sig { override.returns({ id: String, title: String }) }
        def to_hash
        end
      end

      class Contact < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::MessageContent::Contact, Zavudev::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :phones

        sig { params(phones: T::Array[String]).void }
        attr_writer :phones

        sig do
          params(name: String, phones: T::Array[String]).returns(
            T.attached_class
          )
        end
        def self.new(name: nil, phones: nil)
        end

        sig { override.returns({ name: String, phones: T::Array[String] }) }
        def to_hash
        end
      end

      # Optional header type for cta_url messages.
      module CtaHeaderType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::MessageContent::CtaHeaderType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(:text, Zavudev::MessageContent::CtaHeaderType::TaggedSymbol)
        IMAGE =
          T.let(:image, Zavudev::MessageContent::CtaHeaderType::TaggedSymbol)
        VIDEO =
          T.let(:video, Zavudev::MessageContent::CtaHeaderType::TaggedSymbol)
        DOCUMENT =
          T.let(:document, Zavudev::MessageContent::CtaHeaderType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::MessageContent::CtaHeaderType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Section < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::MessageContent::Section, Zavudev::Internal::AnyHash)
          end

        sig { returns(T::Array[Zavudev::MessageContent::Section::Row]) }
        attr_accessor :rows

        sig { returns(String) }
        attr_accessor :title

        sig do
          params(
            rows: T::Array[Zavudev::MessageContent::Section::Row::OrHash],
            title: String
          ).returns(T.attached_class)
        end
        def self.new(rows:, title:)
        end

        sig do
          override.returns(
            {
              rows: T::Array[Zavudev::MessageContent::Section::Row],
              title: String
            }
          )
        end
        def to_hash
        end

        class Row < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::MessageContent::Section::Row,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :title

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig do
            params(id: String, title: String, description: String).returns(
              T.attached_class
            )
          end
          def self.new(id:, title:, description: nil)
          end

          sig do
            override.returns({ id: String, title: String, description: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end
