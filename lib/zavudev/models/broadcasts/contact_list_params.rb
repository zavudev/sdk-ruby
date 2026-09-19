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
        #   - `pending`, `queued`, `sending`: not handed to the provider yet.
        #   - `sent`: accepted by the provider; delivery is not confirmed yet. Channels that
        #     never report delivery leave the recipient here.
        #   - `delivered`: the channel confirmed delivery to the device. A WhatsApp read
        #     receipt also counts as delivered.
        #   - `failed`: not delivered. A recipient can move from `sent` or `delivered` to
        #     `failed` when the provider reports a failure late.
        #   - `skipped`: not sent, because the recipient opted out of the channel or the
        #     broadcast was cancelled before reaching it.
        #
        #   @return [Symbol, Zavudev::Models::BroadcastContactStatus, nil]
        optional :status, enum: -> { Zavudev::BroadcastContactStatus }

        # @!method initialize(broadcast_id:, cursor: nil, limit: nil, status: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::Broadcasts::ContactListParams} for more details.
        #
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
