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

      # Sections for list messages.
      sig { returns(T.nilable(T::Array[Zavudev::MessageContent::Section])) }
      attr_reader :sections

      sig do
        params(
          sections: T::Array[Zavudev::MessageContent::Section::OrHash]
        ).void
      end
      attr_writer :sections

      # Template ID for template messages.
      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      # Variables for template rendering. Keys are variable positions (1, 2, 3...).
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_variables

      sig { params(template_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_variables

      # Content for non-text message types (WhatsApp and Telegram).
      sig do
        params(
          buttons: T::Array[Zavudev::MessageContent::Button::OrHash],
          contacts: T::Array[Zavudev::MessageContent::Contact::OrHash],
          emoji: String,
          filename: String,
          latitude: Float,
          list_button: String,
          location_address: String,
          location_name: String,
          longitude: Float,
          media_id: String,
          media_url: String,
          mime_type: String,
          react_to_message_id: String,
          sections: T::Array[Zavudev::MessageContent::Section::OrHash],
          template_id: String,
          template_variables: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Interactive buttons (max 3).
        buttons: nil,
        # Contact cards for contact messages.
        contacts: nil,
        # Emoji for reaction messages.
        emoji: nil,
        # Filename for documents.
        filename: nil,
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
        # Sections for list messages.
        sections: nil,
        # Template ID for template messages.
        template_id: nil,
        # Variables for template rendering. Keys are variable positions (1, 2, 3...).
        template_variables: nil
      )
      end

      sig do
        override.returns(
          {
            buttons: T::Array[Zavudev::MessageContent::Button],
            contacts: T::Array[Zavudev::MessageContent::Contact],
            emoji: String,
            filename: String,
            latitude: Float,
            list_button: String,
            location_address: String,
            location_name: String,
            longitude: Float,
            media_id: String,
            media_url: String,
            mime_type: String,
            react_to_message_id: String,
            sections: T::Array[Zavudev::MessageContent::Section],
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
