# frozen_string_literal: true

module Zavudev
  module Models
    class ContactChannel < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute channel
      #   Channel type.
      #
      #   @return [Symbol, Zavudev::Models::ContactChannel::Channel]
      required :channel, enum: -> { Zavudev::ContactChannel::Channel }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute identifier
      #   Channel identifier (phone number or email address).
      #
      #   @return [String]
      required :identifier, String

      # @!attribute is_primary
      #   Whether this is the primary channel for its type.
      #
      #   @return [Boolean]
      required :is_primary, Zavudev::Internal::Type::Boolean, api_name: :isPrimary

      # @!attribute verified
      #   Whether this channel has been verified.
      #
      #   @return [Boolean]
      required :verified, Zavudev::Internal::Type::Boolean

      # @!attribute country_code
      #   ISO country code for phone numbers.
      #
      #   @return [String, nil]
      optional :country_code, String, api_name: :countryCode

      # @!attribute label
      #   Optional label for the channel.
      #
      #   @return [String, nil]
      optional :label, String

      # @!attribute last_inbound_at
      #   Last time a message was received on this channel.
      #
      #   @return [Time, nil]
      optional :last_inbound_at, Time, api_name: :lastInboundAt

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute metrics
      #   Delivery metrics for this channel.
      #
      #   @return [Zavudev::Models::ContactChannel::Metrics, nil]
      optional :metrics, -> { Zavudev::ContactChannel::Metrics }

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, channel:, created_at:, identifier:, is_primary:, verified:, country_code: nil, label: nil, last_inbound_at: nil, metadata: nil, metrics: nil, updated_at: nil)
      #   A communication channel for a contact.
      #
      #   @param id [String]
      #
      #   @param channel [Symbol, Zavudev::Models::ContactChannel::Channel] Channel type.
      #
      #   @param created_at [Time]
      #
      #   @param identifier [String] Channel identifier (phone number or email address).
      #
      #   @param is_primary [Boolean] Whether this is the primary channel for its type.
      #
      #   @param verified [Boolean] Whether this channel has been verified.
      #
      #   @param country_code [String] ISO country code for phone numbers.
      #
      #   @param label [String] Optional label for the channel.
      #
      #   @param last_inbound_at [Time] Last time a message was received on this channel.
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param metrics [Zavudev::Models::ContactChannel::Metrics] Delivery metrics for this channel.
      #
      #   @param updated_at [Time]

      # Channel type.
      #
      # @see Zavudev::Models::ContactChannel#channel
      module Channel
        extend Zavudev::Internal::Type::Enum

        SMS = :sms
        WHATSAPP = :whatsapp
        EMAIL = :email
        TELEGRAM = :telegram
        VOICE = :voice

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Zavudev::Models::ContactChannel#metrics
      class Metrics < Zavudev::Internal::Type::BaseModel
        # @!attribute avg_delivery_time_ms
        #
        #   @return [Float, nil]
        optional :avg_delivery_time_ms, Float, api_name: :avgDeliveryTimeMs

        # @!attribute failure_count
        #
        #   @return [Integer, nil]
        optional :failure_count, Integer, api_name: :failureCount

        # @!attribute last_success_at
        #
        #   @return [Time, nil]
        optional :last_success_at, Time, api_name: :lastSuccessAt

        # @!attribute success_count
        #
        #   @return [Integer, nil]
        optional :success_count, Integer, api_name: :successCount

        # @!attribute total_attempts
        #
        #   @return [Integer, nil]
        optional :total_attempts, Integer, api_name: :totalAttempts

        # @!method initialize(avg_delivery_time_ms: nil, failure_count: nil, last_success_at: nil, success_count: nil, total_attempts: nil)
        #   Delivery metrics for this channel.
        #
        #   @param avg_delivery_time_ms [Float]
        #   @param failure_count [Integer]
        #   @param last_success_at [Time]
        #   @param success_count [Integer]
        #   @param total_attempts [Integer]
      end
    end
  end
end
