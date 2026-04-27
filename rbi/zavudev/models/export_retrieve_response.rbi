# typed: strong

module Zavudev
  module Models
    class ExportRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::ExportRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::DataExport) }
      attr_reader :export

      sig { params(export: Zavudev::DataExport::OrHash).void }
      attr_writer :export

      sig do
        params(export: Zavudev::DataExport::OrHash).returns(T.attached_class)
      end
      def self.new(export:)
      end

      sig { override.returns({ export: Zavudev::DataExport }) }
      def to_hash
      end
    end
  end
end
