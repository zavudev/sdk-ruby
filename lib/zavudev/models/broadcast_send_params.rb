# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#send_
    class BroadcastSendParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute broadcast_id
      #
      #   @return [String]
      required :broadcast_id, String

      # @!attribute scheduled_at
      #   Schedule for future delivery. Omit to send immediately.
      #
      #   @return [Time, nil]
      optional :scheduled_at, Time, api_name: :scheduledAt

      # @!method initialize(broadcast_id:, scheduled_at: nil, request_options: {})
      #   @param broadcast_id [String]
      #
      #   @param scheduled_at [Time] Schedule for future delivery. Omit to send immediately.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
