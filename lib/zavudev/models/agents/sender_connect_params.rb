# frozen_string_literal: true

module Zavudev
  module Models
    module Agents
      # @see Zavudev::Resources::Agents::Senders#connect
      class SenderConnectParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute sender_id
        #   Sender to connect.
        #
        #   @return [String]
        required :sender_id, String, api_name: :senderId

        # @!method initialize(agent_id:, sender_id:, request_options: {})
        #   @param agent_id [String]
        #
        #   @param sender_id [String] Sender to connect.
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
