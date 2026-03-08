# typed: strong

module Zavudev
  module Models
    class RegulatoryDocumentUploadURLResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::RegulatoryDocumentUploadURLResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # Pre-signed URL for uploading the file.
      sig { returns(String) }
      attr_accessor :upload_url

      sig { params(upload_url: String).returns(T.attached_class) }
      def self.new(
        # Pre-signed URL for uploading the file.
        upload_url:
      )
      end

      sig { override.returns({ upload_url: String }) }
      def to_hash
      end
    end
  end
end
