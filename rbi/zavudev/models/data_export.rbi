# typed: strong

module Zavudev
  module Models
    class DataExport < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::DataExport, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T::Array[Zavudev::DataExport::DataType::TaggedSymbol]) }
      attr_accessor :data_types

      # When the export download link expires (24 hours after creation).
      sig { returns(Time) }
      attr_accessor :expires_at

      # Status of a data export job.
      sig { returns(Zavudev::DataExport::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(Time)) }
      attr_accessor :completed_at

      sig { returns(T.nilable(Time)) }
      attr_accessor :date_from

      sig { returns(T.nilable(Time)) }
      attr_accessor :date_to

      # URL to download the export file. Only available when status is 'completed'.
      sig { returns(T.nilable(String)) }
      attr_accessor :download_url

      # Error message if the export failed.
      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

      # Size of the export file in bytes.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :file_size

      sig do
        params(
          id: String,
          created_at: Time,
          data_types: T::Array[Zavudev::DataExport::DataType::OrSymbol],
          expires_at: Time,
          status: Zavudev::DataExport::Status::OrSymbol,
          completed_at: T.nilable(Time),
          date_from: T.nilable(Time),
          date_to: T.nilable(Time),
          download_url: T.nilable(String),
          error_message: T.nilable(String),
          file_size: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        data_types:,
        # When the export download link expires (24 hours after creation).
        expires_at:,
        # Status of a data export job.
        status:,
        completed_at: nil,
        date_from: nil,
        date_to: nil,
        # URL to download the export file. Only available when status is 'completed'.
        download_url: nil,
        # Error message if the export failed.
        error_message: nil,
        # Size of the export file in bytes.
        file_size: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            data_types: T::Array[Zavudev::DataExport::DataType::TaggedSymbol],
            expires_at: Time,
            status: Zavudev::DataExport::Status::TaggedSymbol,
            completed_at: T.nilable(Time),
            date_from: T.nilable(Time),
            date_to: T.nilable(Time),
            download_url: T.nilable(String),
            error_message: T.nilable(String),
            file_size: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end

      # Types of data that can be exported.
      module DataType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::DataExport::DataType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGES = T.let(:messages, Zavudev::DataExport::DataType::TaggedSymbol)
        CONVERSATIONS =
          T.let(:conversations, Zavudev::DataExport::DataType::TaggedSymbol)
        WEBHOOK_DELIVERIES =
          T.let(:webhookDeliveries, Zavudev::DataExport::DataType::TaggedSymbol)
        AGENT_EXECUTIONS =
          T.let(:agentExecutions, Zavudev::DataExport::DataType::TaggedSymbol)
        ACTIVITIES =
          T.let(:activities, Zavudev::DataExport::DataType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::DataExport::DataType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Status of a data export job.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::DataExport::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Zavudev::DataExport::Status::TaggedSymbol)
        PROCESSING =
          T.let(:processing, Zavudev::DataExport::Status::TaggedSymbol)
        COMPLETED = T.let(:completed, Zavudev::DataExport::Status::TaggedSymbol)
        FAILED = T.let(:failed, Zavudev::DataExport::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::DataExport::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
