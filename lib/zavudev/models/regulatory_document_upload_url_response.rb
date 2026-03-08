# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::RegulatoryDocuments#upload_url
    class RegulatoryDocumentUploadURLResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute upload_url
      #   Pre-signed URL for uploading the file.
      #
      #   @return [String]
      required :upload_url, String, api_name: :uploadUrl

      # @!method initialize(upload_url:)
      #   @param upload_url [String] Pre-signed URL for uploading the file.
    end
  end
end
