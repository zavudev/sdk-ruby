# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Exports#retrieve
    class ExportRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute export
      #
      #   @return [Zavudev::Models::DataExport]
      required :export, -> { Zavudev::DataExport }

      # @!method initialize(export:)
      #   @param export [Zavudev::Models::DataExport]
    end
  end
end
