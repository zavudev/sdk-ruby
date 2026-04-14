# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Exports#list
    class DataExport < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute data_types
      #
      #   @return [Array<Symbol, Zavudev::Models::DataExport::DataType>]
      required :data_types,
               -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::DataExport::DataType] },
               api_name: :dataTypes

      # @!attribute expires_at
      #   When the export download link expires (24 hours after creation).
      #
      #   @return [Time]
      required :expires_at, Time, api_name: :expiresAt

      # @!attribute status
      #   Status of a data export job.
      #
      #   @return [Symbol, Zavudev::Models::DataExport::Status]
      required :status, enum: -> { Zavudev::DataExport::Status }

      # @!attribute completed_at
      #
      #   @return [Time, nil]
      optional :completed_at, Time, api_name: :completedAt, nil?: true

      # @!attribute date_from
      #
      #   @return [Time, nil]
      optional :date_from, Time, api_name: :dateFrom, nil?: true

      # @!attribute date_to
      #
      #   @return [Time, nil]
      optional :date_to, Time, api_name: :dateTo, nil?: true

      # @!attribute download_url
      #   URL to download the export file. Only available when status is 'completed'.
      #
      #   @return [String, nil]
      optional :download_url, String, api_name: :downloadUrl, nil?: true

      # @!attribute error_message
      #   Error message if the export failed.
      #
      #   @return [String, nil]
      optional :error_message, String, api_name: :errorMessage, nil?: true

      # @!attribute file_size
      #   Size of the export file in bytes.
      #
      #   @return [Integer, nil]
      optional :file_size, Integer, api_name: :fileSize, nil?: true

      # @!method initialize(id:, created_at:, data_types:, expires_at:, status:, completed_at: nil, date_from: nil, date_to: nil, download_url: nil, error_message: nil, file_size: nil)
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param data_types [Array<Symbol, Zavudev::Models::DataExport::DataType>]
      #
      #   @param expires_at [Time] When the export download link expires (24 hours after creation).
      #
      #   @param status [Symbol, Zavudev::Models::DataExport::Status] Status of a data export job.
      #
      #   @param completed_at [Time, nil]
      #
      #   @param date_from [Time, nil]
      #
      #   @param date_to [Time, nil]
      #
      #   @param download_url [String, nil] URL to download the export file. Only available when status is 'completed'.
      #
      #   @param error_message [String, nil] Error message if the export failed.
      #
      #   @param file_size [Integer, nil] Size of the export file in bytes.

      # Types of data that can be exported.
      module DataType
        extend Zavudev::Internal::Type::Enum

        MESSAGES = :messages
        CONVERSATIONS = :conversations
        WEBHOOK_DELIVERIES = :webhookDeliveries
        AGENT_EXECUTIONS = :agentExecutions
        ACTIVITIES = :activities

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Status of a data export job.
      #
      # @see Zavudev::Models::DataExport#status
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
