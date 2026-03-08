# frozen_string_literal: true

module Zavudev
  module Resources
    class RegulatoryDocuments
      # Create a regulatory document record after uploading the file. Use the upload-url
      # endpoint first to get an upload URL.
      #
      # @overload create(document_type:, file_size:, mime_type:, name:, storage_id:, request_options: {})
      #
      # @param document_type [Symbol, Zavudev::Models::RegulatoryDocumentCreateParams::DocumentType]
      #
      # @param file_size [Integer]
      #
      # @param mime_type [String]
      #
      # @param name [String]
      #
      # @param storage_id [String] Storage ID from the upload-url endpoint.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::RegulatoryDocumentCreateResponse]
      #
      # @see Zavudev::Models::RegulatoryDocumentCreateParams
      def create(params)
        parsed, options = Zavudev::RegulatoryDocumentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/documents",
          body: parsed,
          model: Zavudev::Models::RegulatoryDocumentCreateResponse,
          options: options
        )
      end

      # Get a specific regulatory document.
      #
      # @overload retrieve(document_id, request_options: {})
      #
      # @param document_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::RegulatoryDocumentRetrieveResponse]
      #
      # @see Zavudev::Models::RegulatoryDocumentRetrieveParams
      def retrieve(document_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/documents/%1$s", document_id],
          model: Zavudev::Models::RegulatoryDocumentRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List regulatory documents for this project.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::RegulatoryDocument>]
      #
      # @see Zavudev::Models::RegulatoryDocumentListParams
      def list(params = {})
        parsed, options = Zavudev::RegulatoryDocumentListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/documents",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::RegulatoryDocument,
          options: options
        )
      end

      # Delete a regulatory document. Cannot delete verified documents.
      #
      # @overload delete(document_id, request_options: {})
      #
      # @param document_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::RegulatoryDocumentDeleteParams
      def delete(document_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/documents/%1$s", document_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Get a presigned URL to upload a document file. After uploading, use the
      # storageId to create the document record.
      #
      # @overload upload_url(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::RegulatoryDocumentUploadURLResponse]
      #
      # @see Zavudev::Models::RegulatoryDocumentUploadURLParams
      def upload_url(params = {})
        @client.request(
          method: :post,
          path: "v1/documents/upload-url",
          model: Zavudev::Models::RegulatoryDocumentUploadURLResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
