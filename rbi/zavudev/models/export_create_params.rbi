# typed: strong

module Zavudev
  module Models
    class ExportCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ExportCreateParams, Zavudev::Internal::AnyHash)
        end

      # List of data types to include in the export.
      sig { returns(T::Array[Zavudev::ExportCreateParams::DataType::OrSymbol]) }
      attr_accessor :data_types

      # Start date for data to export (inclusive).
      sig { returns(T.nilable(Time)) }
      attr_reader :date_from

      sig { params(date_from: Time).void }
      attr_writer :date_from

      # End date for data to export (inclusive).
      sig { returns(T.nilable(Time)) }
      attr_reader :date_to

      sig { params(date_to: Time).void }
      attr_writer :date_to

      sig do
        params(
          data_types: T::Array[Zavudev::ExportCreateParams::DataType::OrSymbol],
          date_from: Time,
          date_to: Time,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # List of data types to include in the export.
        data_types:,
        # Start date for data to export (inclusive).
        date_from: nil,
        # End date for data to export (inclusive).
        date_to: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            data_types:
              T::Array[Zavudev::ExportCreateParams::DataType::OrSymbol],
            date_from: Time,
            date_to: Time,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Types of data that can be exported.
      module DataType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::ExportCreateParams::DataType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGES =
          T.let(:messages, Zavudev::ExportCreateParams::DataType::TaggedSymbol)
        CONVERSATIONS =
          T.let(
            :conversations,
            Zavudev::ExportCreateParams::DataType::TaggedSymbol
          )
        WEBHOOK_DELIVERIES =
          T.let(
            :webhookDeliveries,
            Zavudev::ExportCreateParams::DataType::TaggedSymbol
          )
        AGENT_EXECUTIONS =
          T.let(
            :agentExecutions,
            Zavudev::ExportCreateParams::DataType::TaggedSymbol
          )
        ACTIVITIES =
          T.let(
            :activities,
            Zavudev::ExportCreateParams::DataType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::ExportCreateParams::DataType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
