# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#list_attachments
    class MessageListAttachmentsResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Zavudev::Models::MessageListAttachmentsResponse::Item>]
      required :items,
               -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::MessageListAttachmentsResponse::Item] }

      # @!method initialize(items:)
      #   @param items [Array<Zavudev::Models::MessageListAttachmentsResponse::Item>]

      class Item < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute content_id
        #   Content-ID for inline attachments (referenced in the HTML body as
        #   `cid:<contentId>`). Null for regular attachments.
        #
        #   @return [String, nil]
        required :content_id, String, api_name: :contentId, nil?: true

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute download_url
        #   Short-lived signed URL to download the attachment bytes. Freshly generated on
        #   each request and expires; do not cache it. Null if the stored file is no longer
        #   available.
        #
        #   @return [String, nil]
        required :download_url, String, api_name: :downloadUrl, nil?: true

        # @!attribute filename
        #
        #   @return [String]
        required :filename, String

        # @!attribute is_inline
        #   Whether the attachment is inline (embedded in the HTML body) rather than a
        #   regular attachment.
        #
        #   @return [Boolean]
        required :is_inline, Zavudev::Internal::Type::Boolean, api_name: :isInline

        # @!attribute mime_type
        #   MIME type of the attachment.
        #
        #   @return [String]
        required :mime_type, String, api_name: :mimeType

        # @!attribute size
        #   Size of the attachment in bytes.
        #
        #   @return [Integer]
        required :size, Integer

        # @!method initialize(id:, content_id:, created_at:, download_url:, filename:, is_inline:, mime_type:, size:)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::MessageListAttachmentsResponse::Item} for more details.
        #
        #   A stored file attachment for an email message (inbound or outbound).
        #
        #   @param id [String]
        #
        #   @param content_id [String, nil] Content-ID for inline attachments (referenced in the HTML body as `cid:<contentI
        #
        #   @param created_at [Time]
        #
        #   @param download_url [String, nil] Short-lived signed URL to download the attachment bytes. Freshly generated on ea
        #
        #   @param filename [String]
        #
        #   @param is_inline [Boolean] Whether the attachment is inline (embedded in the HTML body) rather than a regul
        #
        #   @param mime_type [String] MIME type of the attachment.
        #
        #   @param size [Integer] Size of the attachment in bytes.
      end
    end
  end
end
