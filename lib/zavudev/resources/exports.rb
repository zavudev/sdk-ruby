# frozen_string_literal: true

module Zavudev
  module Resources
    class Exports
      # Create a new data export job. The export will be processed asynchronously and
      # the download URL will be available when status is 'completed'. Export links
      # expire after 24 hours.
      #
      # @overload create(data_types:, date_from: nil, date_to: nil, request_options: {})
      #
      # @param data_types [Array<Symbol, Zavudev::Models::ExportCreateParams::DataType>] List of data types to include in the export.
      #
      # @param date_from [Time] Start date for data to export (inclusive).
      #
      # @param date_to [Time] End date for data to export (inclusive).
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::ExportCreateResponse]
      #
      # @see Zavudev::Models::ExportCreateParams
      def create(params)
        parsed, options = Zavudev::ExportCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/exports",
          body: parsed,
          model: Zavudev::Models::ExportCreateResponse,
          options: options
        )
      end

      # Get details of a specific data export, including download URL when completed.
      #
      # @overload retrieve(export_id, request_options: {})
      #
      # @param export_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::ExportRetrieveResponse]
      #
      # @see Zavudev::Models::ExportRetrieveParams
      def retrieve(export_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/exports/%1$s", export_id],
          model: Zavudev::Models::ExportRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List data exports for this project.
      #
      # @overload list(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String]
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::ExportListParams::Status] Status of a data export job.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::DataExport>]
      #
      # @see Zavudev::Models::ExportListParams
      def list(params = {})
        parsed, options = Zavudev::ExportListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/exports",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::DataExport,
          options: options
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
