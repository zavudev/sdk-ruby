# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Exports#retrieve
    class ExportRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute export_id
      #
      #   @return [String]
      required :export_id, String

      # @!method initialize(export_id:, request_options: {})
      #   @param export_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
