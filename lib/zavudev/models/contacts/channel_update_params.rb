# frozen_string_literal: true

module Zavudev
  module Models
    module Contacts
      # @see Zavudev::Resources::Contacts::Channels#update
      class ChannelUpdateParams < Zavudev::Internal::Type::BaseModel
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

        # @!attribute label
        #   Optional label for the channel. Set to null to clear.
        #
        #   @return [String, nil]
        optional :label, String, nil?: true

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Zavudev::Internal::Type::HashOf[String]

        # @!attribute verified
        #   Whether the channel is verified.
        #
        #   @return [Boolean, nil]
        optional :verified, Zavudev::Internal::Type::Boolean

        # @!method initialize(contact_id:, channel_id:, label: nil, metadata: nil, verified: nil, request_options: {})
        #   @param contact_id [String]
        #
        #   @param channel_id [String]
        #
        #   @param label [String, nil] Optional label for the channel. Set to null to clear.
        #
        #   @param metadata [Hash{Symbol=>String}]
        #
        #   @param verified [Boolean] Whether the channel is verified.
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
