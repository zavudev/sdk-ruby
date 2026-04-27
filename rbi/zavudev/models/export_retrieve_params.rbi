# typed: strong

module Zavudev
  module Models
    class ExportRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ExportRetrieveParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :export_id

      sig do
        params(
          export_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(export_id:, request_options: {})
      end

      sig do
        override.returns(
          { export_id: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
