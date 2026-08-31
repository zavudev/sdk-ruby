# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Agents#retrieve
    class AgentRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute agent_id
      #
      #   @return [String]
      required :agent_id, String

      # @!method initialize(agent_id:, request_options: {})
      #   @param agent_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
