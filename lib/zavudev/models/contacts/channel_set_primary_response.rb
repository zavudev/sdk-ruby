# frozen_string_literal: true

module Zavudev
  module Models
    module Contacts
      # @see Zavudev::Resources::Contacts::Channels#set_primary
      class ChannelSetPrimaryResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute channel
        #   A communication channel for a contact.
        #
        #   @return [Zavudev::Models::ContactChannel]
        required :channel, -> { Zavudev::ContactChannel }

        # @!method initialize(channel:)
        #   @param channel [Zavudev::Models::ContactChannel] A communication channel for a contact.
      end
    end
  end
end
