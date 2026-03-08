# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Flows#duplicate
        class FlowDuplicateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute flow_id
          #
          #   @return [String]
          required :flow_id, String

          # @!attribute new_name
          #
          #   @return [String]
          required :new_name, String, api_name: :newName

          # @!method initialize(sender_id:, flow_id:, new_name:, request_options: {})
          #   @param sender_id [String]
          #   @param flow_id [String]
          #   @param new_name [String]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
