# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Executions#list
        class ExecutionListParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute cursor
          #
          #   @return [String, nil]
          optional :cursor, String

          # @!attribute limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute status
          #   Status of an agent execution.
          #
          #   @return [Symbol, Zavudev::Models::Senders::AgentExecutionStatus, nil]
          optional :status, enum: -> { Zavudev::Senders::AgentExecutionStatus }

          # @!method initialize(sender_id:, cursor: nil, limit: nil, status: nil, request_options: {})
          #   @param sender_id [String]
          #
          #   @param cursor [String]
          #
          #   @param limit [Integer]
          #
          #   @param status [Symbol, Zavudev::Models::Senders::AgentExecutionStatus] Status of an agent execution.
          #
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
