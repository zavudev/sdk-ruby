# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Exports#create
    class ExportCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute data_types
      #   List of data types to include in the export.
      #
      #   @return [Array<Symbol, Zavudev::Models::ExportCreateParams::DataType>]
      required :data_types,
               -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::ExportCreateParams::DataType] },
               api_name: :dataTypes

      # @!attribute date_from
      #   Start date for data to export (inclusive).
      #
      #   @return [Time, nil]
      optional :date_from, Time, api_name: :dateFrom

      # @!attribute date_to
      #   End date for data to export (inclusive).
      #
      #   @return [Time, nil]
      optional :date_to, Time, api_name: :dateTo

      # @!method initialize(data_types:, date_from: nil, date_to: nil, request_options: {})
      #   @param data_types [Array<Symbol, Zavudev::Models::ExportCreateParams::DataType>] List of data types to include in the export.
      #
      #   @param date_from [Time] Start date for data to export (inclusive).
      #
      #   @param date_to [Time] End date for data to export (inclusive).
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

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
    end
  end
end
