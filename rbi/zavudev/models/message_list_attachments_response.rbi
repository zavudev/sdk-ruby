# typed: strong

module Zavudev
  module Models
    class MessageListAttachmentsResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::MessageListAttachmentsResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[Zavudev::Models::MessageListAttachmentsResponse::Item])
      end
      attr_accessor :items

      sig do
        params(
          items:
            T::Array[
              Zavudev::Models::MessageListAttachmentsResponse::Item::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(items:)
      end

      sig do
        override.returns(
          {
            items:
              T::Array[Zavudev::Models::MessageListAttachmentsResponse::Item]
          }
        )
      end
      def to_hash
      end

      class Item < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::MessageListAttachmentsResponse::Item,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Content-ID for inline attachments (referenced in the HTML body as
        # `cid:<contentId>`). Null for regular attachments.
        sig { returns(T.nilable(String)) }
        attr_accessor :content_id

        sig { returns(Time) }
        attr_accessor :created_at

        # Short-lived signed URL to download the attachment bytes. Freshly generated on
        # each request and expires; do not cache it. Null if the stored file is no longer
        # available.
        sig { returns(T.nilable(String)) }
        attr_accessor :download_url

        sig { returns(String) }
        attr_accessor :filename

        # Whether the attachment is inline (embedded in the HTML body) rather than a
        # regular attachment.
        sig { returns(T::Boolean) }
        attr_accessor :is_inline

        # MIME type of the attachment.
        sig { returns(String) }
        attr_accessor :mime_type

        # Size of the attachment in bytes.
        sig { returns(Integer) }
        attr_accessor :size

        # A stored file attachment for an email message (inbound or outbound).
        sig do
          params(
            id: String,
            content_id: T.nilable(String),
            created_at: Time,
            download_url: T.nilable(String),
            filename: String,
            is_inline: T::Boolean,
            mime_type: String,
            size: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Content-ID for inline attachments (referenced in the HTML body as
          # `cid:<contentId>`). Null for regular attachments.
          content_id:,
          created_at:,
          # Short-lived signed URL to download the attachment bytes. Freshly generated on
          # each request and expires; do not cache it. Null if the stored file is no longer
          # available.
          download_url:,
          filename:,
          # Whether the attachment is inline (embedded in the HTML body) rather than a
          # regular attachment.
          is_inline:,
          # MIME type of the attachment.
          mime_type:,
          # Size of the attachment in bytes.
          size:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              content_id: T.nilable(String),
              created_at: Time,
              download_url: T.nilable(String),
              filename: String,
              is_inline: T::Boolean,
              mime_type: String,
              size: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
