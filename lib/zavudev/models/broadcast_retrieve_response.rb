# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#retrieve
    class BroadcastRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute broadcast
      #
      #   @return [Zavudev::Models::Broadcast]
      required :broadcast, -> { Zavudev::Broadcast }

      # @!method initialize(broadcast:)
      #   @param broadcast [Zavudev::Models::Broadcast]
    end
  end
end
