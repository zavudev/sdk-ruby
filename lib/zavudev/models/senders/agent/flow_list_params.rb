# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Flows#list
        class FlowListParams < Zavudev::Internal::Type::BaseModel
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

          # @!attribute enabled
          #
          #   @return [Boolean, nil]
          optional :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!method initialize(sender_id:, cursor: nil, enabled: nil, limit: nil, request_options: {})
          #   @param sender_id [String]
          #   @param cursor [String]
          #   @param enabled [Boolean]
          #   @param limit [Integer]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
