# frozen_string_literal: true

module Zavudev
  module Models
    module Broadcasts
      # @see Zavudev::Resources::Broadcasts::Contacts#list
      class ContactListParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute broadcast_id
        #
        #   @return [String]
        required :broadcast_id, String

        # @!attribute cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute status
        #   Status of a contact within a broadcast.
        #
        #   @return [Symbol, Zavudev::Models::BroadcastContactStatus, nil]
        optional :status, enum: -> { Zavudev::BroadcastContactStatus }

        # @!method initialize(broadcast_id:, cursor: nil, limit: nil, status: nil, request_options: {})
        #   @param broadcast_id [String]
        #
        #   @param cursor [String]
        #
        #   @param limit [Integer]
        #
        #   @param status [Symbol, Zavudev::Models::BroadcastContactStatus] Status of a contact within a broadcast.
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
