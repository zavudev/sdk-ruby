# typed: strong

module Zavudev
  module Models
    class ExportListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ExportListParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Status of a data export job.
      sig { returns(T.nilable(Zavudev::ExportListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::ExportListParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::ExportListParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        limit: nil,
        # Status of a data export job.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: Zavudev::ExportListParams::Status::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Status of a data export job.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::ExportListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, Zavudev::ExportListParams::Status::TaggedSymbol)
        PROCESSING =
          T.let(:processing, Zavudev::ExportListParams::Status::TaggedSymbol)
        COMPLETED =
          T.let(:completed, Zavudev::ExportListParams::Status::TaggedSymbol)
        FAILED = T.let(:failed, Zavudev::ExportListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::ExportListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
