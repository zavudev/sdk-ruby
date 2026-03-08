# typed: strong

module Zavudev
  module Resources
    class RegulatoryDocuments
      # Create a regulatory document record after uploading the file. Use the upload-url
      # endpoint first to get an upload URL.
      sig do
        params(
          document_type:
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::OrSymbol,
          file_size: Integer,
          mime_type: String,
          name: String,
          storage_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::RegulatoryDocumentCreateResponse)
      end
      def create(
        document_type:,
        file_size:,
        mime_type:,
        name:,
        # Storage ID from the upload-url endpoint.
        storage_id:,
        request_options: {}
      )
      end

      # Get a specific regulatory document.
      sig do
        params(
          document_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::RegulatoryDocumentRetrieveResponse)
      end
      def retrieve(document_id, request_options: {})
      end

      # List regulatory documents for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::RegulatoryDocument])
      end
      def list(cursor: nil, limit: nil, request_options: {})
      end

      # Delete a regulatory document. Cannot delete verified documents.
      sig do
        params(
          document_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(document_id, request_options: {})
      end

      # Get a presigned URL to upload a document file. After uploading, use the
      # storageId to create the document record.
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::RegulatoryDocumentUploadURLResponse
        )
      end
      def upload_url(request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
