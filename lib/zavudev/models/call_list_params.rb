# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Calls#list
    class CallListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute direction
      #   Whether the call was placed by Zavu (outbound) or received from a caller
      #   (inbound).
      #
      #   @return [Symbol, Zavudev::Models::CallListParams::Direction, nil]
      optional :direction, enum: -> { Zavudev::CallListParams::Direction }

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Lifecycle status of a voice call.
      #
      #   - `queued`: outbound call created, not yet dialing.
      #   - `ringing`: dialing (outbound) or received and ringing (inbound).
      #   - `in_progress`: answered, the agent is connected.
      #   - `completed`: ended after a conversation.
      #   - `failed`: could not be completed.
      #   - `busy`: the line was busy.
      #   - `no_answer`: rang but was not answered.
      #   - `canceled`: canceled before it was answered.
      #
      #   @return [Symbol, Zavudev::Models::CallListParams::Status, nil]
      optional :status, enum: -> { Zavudev::CallListParams::Status }

      # @!method initialize(cursor: nil, direction: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::CallListParams} for more details.
      #
      #   @param cursor [String]
      #
      #   @param direction [Symbol, Zavudev::Models::CallListParams::Direction] Whether the call was placed by Zavu (outbound) or received from a caller (inboun
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::CallListParams::Status] Lifecycle status of a voice call.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Whether the call was placed by Zavu (outbound) or received from a caller
      # (inbound).
      module Direction
        extend Zavudev::Internal::Type::Enum

        INBOUND = :inbound
        OUTBOUND = :outbound

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Lifecycle status of a voice call.
      #
      # - `queued`: outbound call created, not yet dialing.
      # - `ringing`: dialing (outbound) or received and ringing (inbound).
      # - `in_progress`: answered, the agent is connected.
      # - `completed`: ended after a conversation.
      # - `failed`: could not be completed.
      # - `busy`: the line was busy.
      # - `no_answer`: rang but was not answered.
      # - `canceled`: canceled before it was answered.
      module Status
        extend Zavudev::Internal::Type::Enum

        QUEUED = :queued
        RINGING = :ringing
        IN_PROGRESS = :in_progress
        COMPLETED = :completed
        FAILED = :failed
        BUSY = :busy
        NO_ANSWER = :no_answer
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
