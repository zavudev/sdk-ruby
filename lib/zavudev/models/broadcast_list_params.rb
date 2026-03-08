# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#list
    class BroadcastListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Current status of the broadcast.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastStatus, nil]
      optional :status, enum: -> { Zavudev::BroadcastStatus }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::BroadcastStatus] Current status of the broadcast.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
