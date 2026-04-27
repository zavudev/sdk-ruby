# frozen_string_literal: true

module Zavudev
  module Models
    module Contacts
      # @see Zavudev::Resources::Contacts::Channels#remove
      class ChannelRemoveParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute contact_id
        #
        #   @return [String]
        required :contact_id, String

        # @!attribute channel_id
        #
        #   @return [String]
        required :channel_id, String

        # @!method initialize(contact_id:, channel_id:, request_options: {})
        #   @param contact_id [String]
        #   @param channel_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
