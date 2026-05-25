# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#tail_logs
    class FunctionTailLogsResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute events
      #
      #   @return [Array<Zavudev::Models::FunctionTailLogsResponse::Event>]
      required :events,
               -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::FunctionTailLogsResponse::Event] }

      # @!attribute next_token
      #   Pass to the next request to fetch the following page of logs.
      #
      #   @return [String, nil]
      optional :next_token, String, api_name: :nextToken, nil?: true

      # @!method initialize(events:, next_token: nil)
      #   @param events [Array<Zavudev::Models::FunctionTailLogsResponse::Event>]
      #
      #   @param next_token [String, nil] Pass to the next request to fetch the following page of logs.

      class Event < Zavudev::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!attribute timestamp
        #
        #   @return [Time]
        required :timestamp, Time

        # @!method initialize(message:, timestamp:)
        #   @param message [String]
        #   @param timestamp [Time]
      end
    end
  end
end
