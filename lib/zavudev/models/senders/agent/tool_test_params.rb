# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#test_
        class ToolTestParams < Zavudev::Internal::Type::BaseModel
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

          # @!attribute test_params
          #   Parameters to pass to the tool for testing.
          #
          #   @return [Hash{Symbol=>Object}]
          required :test_params,
                   Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown],
                   api_name: :testParams

          # @!method initialize(sender_id:, tool_id:, test_params:, request_options: {})
          #   @param sender_id [String]
          #
          #   @param tool_id [String]
          #
          #   @param test_params [Hash{Symbol=>Object}] Parameters to pass to the tool for testing.
          #
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
