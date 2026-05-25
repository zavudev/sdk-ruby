# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#tail_logs
    class FunctionTailLogsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute function_id
      #
      #   @return [String]
      required :function_id, String

      # @!attribute end_time
      #   End of the log window in Unix epoch milliseconds.
      #
      #   @return [Integer, nil]
      optional :end_time, Integer

      # @!attribute filter_pattern
      #
      #   @return [String, nil]
      optional :filter_pattern, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute next_token
      #
      #   @return [String, nil]
      optional :next_token, String

      # @!attribute start_time
      #   Start of the log window in Unix epoch milliseconds.
      #
      #   @return [Integer, nil]
      optional :start_time, Integer

      # @!method initialize(function_id:, end_time: nil, filter_pattern: nil, limit: nil, next_token: nil, start_time: nil, request_options: {})
      #   @param function_id [String]
      #
      #   @param end_time [Integer] End of the log window in Unix epoch milliseconds.
      #
      #   @param filter_pattern [String]
      #
      #   @param limit [Integer]
      #
      #   @param next_token [String]
      #
      #   @param start_time [Integer] Start of the log window in Unix epoch milliseconds.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
