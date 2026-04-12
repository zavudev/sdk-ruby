# typed: strong

module Zavudev
  module Models
    class MessageSendParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageSendParams, Zavudev::Internal::AnyHash)
        end

      # Recipient phone number in E.164 format, email address, or numeric chat ID (for
      # Telegram/Instagram).
      sig { returns(String) }
      attr_accessor :to

      # Email attachments. Only supported when channel is 'email'. Maximum 40MB total
      # size.
      sig do
        returns(T.nilable(T::Array[Zavudev::MessageSendParams::Attachment]))
      end
      attr_reader :attachments

      sig do
        params(
          attachments: T::Array[Zavudev::MessageSendParams::Attachment::OrHash]
        ).void
      end
      attr_writer :attachments

      # Delivery channel. Use 'auto' for intelligent routing. If omitted, channel is
      # auto-selected based on sender capabilities and recipient type. For email
      # recipients, defaults to 'email'.
      sig { returns(T.nilable(Zavudev::Channel::OrSymbol)) }
      attr_reader :channel

      sig { params(channel: Zavudev::Channel::OrSymbol).void }
      attr_writer :channel

      # Additional content for non-text message types.
      sig { returns(T.nilable(Zavudev::MessageContent)) }
      attr_reader :content

      sig { params(content: Zavudev::MessageContent::OrHash).void }
      attr_writer :content

      # Whether to enable automatic fallback to SMS if WhatsApp fails. Defaults to true.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fallback_enabled

      sig { params(fallback_enabled: T::Boolean).void }
      attr_writer :fallback_enabled

      # HTML body for email messages. If provided, email will be sent as multipart with
      # both text and HTML.
      sig { returns(T.nilable(String)) }
      attr_reader :html_body

      sig { params(html_body: String).void }
      attr_writer :html_body

      # Optional idempotency key to avoid duplicate sends.
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Type of message. Defaults to 'text'.
      sig { returns(T.nilable(Zavudev::MessageType::OrSymbol)) }
      attr_reader :message_type

      sig { params(message_type: Zavudev::MessageType::OrSymbol).void }
      attr_writer :message_type

      # Arbitrary metadata to associate with the message.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Reply-To email address for email messages.
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to

      sig { params(reply_to: String).void }
      attr_writer :reply_to

      # Email subject line. Required when channel is 'email' or recipient is an email
      # address.
      sig { returns(T.nilable(String)) }
      attr_reader :subject

      sig { params(subject: String).void }
      attr_writer :subject

      # Text body for text messages or caption for media messages.
      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      # Language code for voice text-to-speech (e.g., 'en-US', 'es-ES', 'pt-BR'). If
      # omitted, language is auto-detected from recipient's country code.
      sig { returns(T.nilable(String)) }
      attr_reader :voice_language

      sig { params(voice_language: String).void }
      attr_writer :voice_language

      sig { returns(T.nilable(String)) }
      attr_reader :zavu_sender

      sig { params(zavu_sender: String).void }
      attr_writer :zavu_sender

      sig do
        params(
          to: String,
          attachments: T::Array[Zavudev::MessageSendParams::Attachment::OrHash],
          channel: Zavudev::Channel::OrSymbol,
          content: Zavudev::MessageContent::OrHash,
          fallback_enabled: T::Boolean,
          html_body: String,
          idempotency_key: String,
          message_type: Zavudev::MessageType::OrSymbol,
          metadata: T::Hash[Symbol, String],
          reply_to: String,
          subject: String,
          text: String,
          voice_language: String,
          zavu_sender: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Recipient phone number in E.164 format, email address, or numeric chat ID (for
        # Telegram/Instagram).
        to:,
        # Email attachments. Only supported when channel is 'email'. Maximum 40MB total
        # size.
        attachments: nil,
        # Delivery channel. Use 'auto' for intelligent routing. If omitted, channel is
        # auto-selected based on sender capabilities and recipient type. For email
        # recipients, defaults to 'email'.
        channel: nil,
        # Additional content for non-text message types.
        content: nil,
        # Whether to enable automatic fallback to SMS if WhatsApp fails. Defaults to true.
        fallback_enabled: nil,
        # HTML body for email messages. If provided, email will be sent as multipart with
        # both text and HTML.
        html_body: nil,
        # Optional idempotency key to avoid duplicate sends.
        idempotency_key: nil,
        # Type of message. Defaults to 'text'.
        message_type: nil,
        # Arbitrary metadata to associate with the message.
        metadata: nil,
        # Reply-To email address for email messages.
        reply_to: nil,
        # Email subject line. Required when channel is 'email' or recipient is an email
        # address.
        subject: nil,
        # Text body for text messages or caption for media messages.
        text: nil,
        # Language code for voice text-to-speech (e.g., 'en-US', 'es-ES', 'pt-BR'). If
        # omitted, language is auto-detected from recipient's country code.
        voice_language: nil,
        zavu_sender: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            to: String,
            attachments: T::Array[Zavudev::MessageSendParams::Attachment],
            channel: Zavudev::Channel::OrSymbol,
            content: Zavudev::MessageContent,
            fallback_enabled: T::Boolean,
            html_body: String,
            idempotency_key: String,
            message_type: Zavudev::MessageType::OrSymbol,
            metadata: T::Hash[Symbol, String],
            reply_to: String,
            subject: String,
            text: String,
            voice_language: String,
            zavu_sender: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Attachment < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::MessageSendParams::Attachment,
              Zavudev::Internal::AnyHash
            )
          end

        # Name of the attached file.
        sig { returns(String) }
        attr_accessor :filename

        # Content of the attached file as a Base64-encoded string.
        sig { returns(T.nilable(String)) }
        attr_reader :content

        sig { params(content: String).void }
        attr_writer :content

        # Content ID for inline images. Reference in HTML as
        # `<img src="cid:your_content_id">`.
        sig { returns(T.nilable(String)) }
        attr_reader :content_id

        sig { params(content_id: String).void }
        attr_writer :content_id

        # MIME type of the attachment. If not set, will be derived from the filename.
        sig { returns(T.nilable(String)) }
        attr_reader :content_type

        sig { params(content_type: String).void }
        attr_writer :content_type

        # URL where the attachment file is hosted. The server will fetch the file.
        sig { returns(T.nilable(String)) }
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        # Email attachment. Provide either `content` (base64) or `path` (URL), not both.
        sig do
          params(
            filename: String,
            content: String,
            content_id: String,
            content_type: String,
            path: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the attached file.
          filename:,
          # Content of the attached file as a Base64-encoded string.
          content: nil,
          # Content ID for inline images. Reference in HTML as
          # `<img src="cid:your_content_id">`.
          content_id: nil,
          # MIME type of the attachment. If not set, will be derived from the filename.
          content_type: nil,
          # URL where the attachment file is hosted. The server will fetch the file.
          path: nil
        )
        end

        sig do
          override.returns(
            {
              filename: String,
              content: String,
              content_id: String,
              content_type: String,
              path: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
