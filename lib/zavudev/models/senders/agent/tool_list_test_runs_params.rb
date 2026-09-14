# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#list_test_runs
        class ToolListTestRunsParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute tool_id
          #
          #   @return [String]
          required :tool_id, String

          # @!attribute limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!method initialize(sender_id:, tool_id:, limit: nil, request_options: {})
          #   @param sender_id [String]
          #   @param tool_id [String]
          #   @param limit [Integer]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
