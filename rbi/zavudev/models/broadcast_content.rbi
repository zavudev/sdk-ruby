# typed: strong

module Zavudev
  module Models
    class BroadcastContent < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastContent, Zavudev::Internal::AnyHash)
        end

      # Filename for documents.
      sig { returns(T.nilable(String)) }
      attr_reader :filename

      sig { params(filename: String).void }
      attr_writer :filename

      # Media ID if already uploaded.
      sig { returns(T.nilable(String)) }
      attr_reader :media_id

      sig { params(media_id: String).void }
      attr_writer :media_id

      # URL of the media file.
      sig { returns(T.nilable(String)) }
      attr_reader :media_url

      sig { params(media_url: String).void }
      attr_writer :media_url

      # MIME type of the media.
      sig { returns(T.nilable(String)) }
      attr_reader :mime_type

      sig { params(mime_type: String).void }
      attr_writer :mime_type

      # Default button variables for dynamic URL/OTP buttons. Keys are the button index
      # (0, 1, 2). Per-contact values override these.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_button_variables

      sig { params(template_button_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_button_variables

      # Default value for a text-header variable, keyed by `1` (can be overridden per
      # contact). If omitted, Zavu resolves the header from `templateVariables` by the
      # header placeholder's name.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_header_variables

      sig { params(template_header_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_header_variables

      # Template ID for template messages.
      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      # Default body variables (can be overridden per contact). Key them to match the
      # template body: by position (`1`, `2`, ...) for positional templates, or by name
      # (e.g. `customer_name`) for named templates. Zavu detects the template's format
      # and sends the correct payload to Meta. Do not mix positional and named keys.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_variables

      sig { params(template_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_variables

      # Content for non-text broadcast message types.
      sig do
        params(
          filename: String,
          media_id: String,
          media_url: String,
          mime_type: String,
          template_button_variables: T::Hash[Symbol, String],
          template_header_variables: T::Hash[Symbol, String],
          template_id: String,
          template_variables: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Filename for documents.
        filename: nil,
        # Media ID if already uploaded.
        media_id: nil,
        # URL of the media file.
        media_url: nil,
        # MIME type of the media.
        mime_type: nil,
        # Default button variables for dynamic URL/OTP buttons. Keys are the button index
        # (0, 1, 2). Per-contact values override these.
        template_button_variables: nil,
        # Default value for a text-header variable, keyed by `1` (can be overridden per
        # contact). If omitted, Zavu resolves the header from `templateVariables` by the
        # header placeholder's name.
        template_header_variables: nil,
        # Template ID for template messages.
        template_id: nil,
        # Default body variables (can be overridden per contact). Key them to match the
        # template body: by position (`1`, `2`, ...) for positional templates, or by name
        # (e.g. `customer_name`) for named templates. Zavu detects the template's format
        # and sends the correct payload to Meta. Do not mix positional and named keys.
        template_variables: nil
      )
      end

      sig do
        override.returns(
          {
            filename: String,
            media_id: String,
            media_url: String,
            mime_type: String,
            template_button_variables: T::Hash[Symbol, String],
            template_header_variables: T::Hash[Symbol, String],
            template_id: String,
            template_variables: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
