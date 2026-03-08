# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::Agent#stats
      class AgentStatsParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute sender_id
        #
        #   @return [String]
        required :sender_id, String

        # @!method initialize(sender_id:, request_options: {})
        #   @param sender_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
