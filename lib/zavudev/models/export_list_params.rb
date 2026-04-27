# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Exports#list
    class ExportListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Status of a data export job.
      #
      #   @return [Symbol, Zavudev::Models::ExportListParams::Status, nil]
      optional :status, enum: -> { Zavudev::ExportListParams::Status }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::ExportListParams::Status] Status of a data export job.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Status of a data export job.
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        PROCESSING = :processing
        COMPLETED = :completed
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
