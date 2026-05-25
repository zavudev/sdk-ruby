# typed: strong

module Zavudev
  module Models
    class FunctionTailLogsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::FunctionTailLogsParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :function_id

      # End of the log window in Unix epoch milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :end_time

      sig { params(end_time: Integer).void }
      attr_writer :end_time

      sig { returns(T.nilable(String)) }
      attr_reader :filter_pattern

      sig { params(filter_pattern: String).void }
      attr_writer :filter_pattern

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(String)) }
      attr_reader :next_token

      sig { params(next_token: String).void }
      attr_writer :next_token

      # Start of the log window in Unix epoch milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :start_time

      sig { params(start_time: Integer).void }
      attr_writer :start_time

      sig do
        params(
          function_id: String,
          end_time: Integer,
          filter_pattern: String,
          limit: Integer,
          next_token: String,
          start_time: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        function_id:,
        # End of the log window in Unix epoch milliseconds.
        end_time: nil,
        filter_pattern: nil,
        limit: nil,
        next_token: nil,
        # Start of the log window in Unix epoch milliseconds.
        start_time: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            function_id: String,
            end_time: Integer,
            filter_pattern: String,
            limit: Integer,
            next_token: String,
            start_time: Integer,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
