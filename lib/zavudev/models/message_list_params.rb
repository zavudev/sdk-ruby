# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#list
    class MessageListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute channel
      #   Filter by delivery channel.
      #
      #   @return [Symbol, Zavudev::Models::MessageListParams::Channel, nil]
      optional :channel, enum: -> { Zavudev::MessageListParams::Channel }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Filter by status. Not all stored statuses are filterable.
      #
      #   @return [Symbol, Zavudev::Models::MessageListParams::Status, nil]
      optional :status, enum: -> { Zavudev::MessageListParams::Status }

      # @!attribute to
      #
      #   @return [String, nil]
      optional :to, String

      # @!method initialize(channel: nil, cursor: nil, limit: nil, status: nil, to: nil, request_options: {})
      #   @param channel [Symbol, Zavudev::Models::MessageListParams::Channel] Filter by delivery channel.
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::MessageListParams::Status] Filter by status. Not all stored statuses are filterable.
      #
      #   @param to [String]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Filter by delivery channel.
      module Channel
        extend Zavudev::Internal::Type::Enum

        SMS = :sms
        SMS_ONEWAY = :sms_oneway
        WHATSAPP = :whatsapp
        EMAIL = :email
        TELEGRAM = :telegram
        INSTAGRAM = :instagram
        MESSENGER = :messenger
        VOICE = :voice

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by status. Not all stored statuses are filterable.
      module Status
        extend Zavudev::Internal::Type::Enum

        QUEUED = :queued
        SENDING = :sending
        SENT = :sent
        DELIVERED = :delivered
        FAILED = :failed
        RECEIVED = :received

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
