# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#list
    class MessageListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute channel
      #   Delivery channel. Use 'auto' for intelligent routing.
      #
      #   @return [Symbol, Zavudev::Models::Channel, nil]
      optional :channel, enum: -> { Zavudev::Channel }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::MessageStatus, nil]
      optional :status, enum: -> { Zavudev::MessageStatus }

      # @!attribute to
      #
      #   @return [String, nil]
      optional :to, String

      # @!method initialize(channel: nil, cursor: nil, limit: nil, status: nil, to: nil, request_options: {})
      #   @param channel [Symbol, Zavudev::Models::Channel] Delivery channel. Use 'auto' for intelligent routing.
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::MessageStatus]
      #
      #   @param to [String]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
