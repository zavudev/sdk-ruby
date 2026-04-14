# typed: strong

module Zavudev
  module Resources
    class Exports
      # Create a new data export job. The export will be processed asynchronously and
      # the download URL will be available when status is 'completed'. Export links
      # expire after 24 hours.
      sig do
        params(
          data_types: T::Array[Zavudev::ExportCreateParams::DataType::OrSymbol],
          date_from: Time,
          date_to: Time,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::ExportCreateResponse)
      end
      def create(
        # List of data types to include in the export.
        data_types:,
        # Start date for data to export (inclusive).
        date_from: nil,
        # End date for data to export (inclusive).
        date_to: nil,
        request_options: {}
      )
      end

      # Get details of a specific data export, including download URL when completed.
      sig do
        params(
          export_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::ExportRetrieveResponse)
      end
      def retrieve(export_id, request_options: {})
      end

      # List data exports for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::ExportListParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::DataExport])
      end
      def list(
        cursor: nil,
        limit: nil,
        # Status of a data export job.
        status: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
