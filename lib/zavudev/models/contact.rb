# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#retrieve
    class Contact < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute available_channels
      #   List of available messaging channels for this contact.
      #
      #   @return [Array<String>]
      required :available_channels, Zavudev::Internal::Type::ArrayOf[String], api_name: :availableChannels

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}]
      required :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute verified
      #   Whether this contact has been verified.
      #
      #   @return [Boolean]
      required :verified, Zavudev::Internal::Type::Boolean

      # @!attribute channels
      #   All communication channels for this contact.
      #
      #   @return [Array<Zavudev::Models::Contact::Channel>, nil]
      optional :channels, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Contact::Channel] }

      # @!attribute country_code
      #
      #   @return [String, nil]
      optional :country_code, String, api_name: :countryCode

      # @!attribute default_channel
      #   Preferred channel for this contact.
      #
      #   @return [Symbol, Zavudev::Models::Contact::DefaultChannel, nil]
      optional :default_channel, enum: -> { Zavudev::Contact::DefaultChannel }, api_name: :defaultChannel

      # @!attribute display_name
      #   Display name for the contact.
      #
      #   @return [String, nil]
      optional :display_name, String, api_name: :displayName

      # @!attribute phone_number
      #   DEPRECATED: Use primaryPhone instead. Primary phone number in E.164 format.
      #
      #   @return [String, nil]
      optional :phone_number, String, api_name: :phoneNumber

      # @!attribute primary_email
      #   Primary email address.
      #
      #   @return [String, nil]
      optional :primary_email, String, api_name: :primaryEmail

      # @!attribute primary_phone
      #   Primary phone number in E.164 format.
      #
      #   @return [String, nil]
      optional :primary_phone, String, api_name: :primaryPhone

      # @!attribute profile_name
      #   Contact's WhatsApp profile name. Only available for WhatsApp contacts.
      #
      #   @return [String, nil]
      optional :profile_name, String, api_name: :profileName, nil?: true

      # @!attribute suggested_merge_with
      #   ID of a contact suggested for merging.
      #
      #   @return [String, nil]
      optional :suggested_merge_with, String, api_name: :suggestedMergeWith

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id:, available_channels:, created_at:, metadata:, verified:, channels: nil, country_code: nil, default_channel: nil, display_name: nil, phone_number: nil, primary_email: nil, primary_phone: nil, profile_name: nil, suggested_merge_with: nil, updated_at: nil)
      #   @param id [String]
      #
      #   @param available_channels [Array<String>] List of available messaging channels for this contact.
      #
      #   @param created_at [Time]
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param verified [Boolean] Whether this contact has been verified.
      #
      #   @param channels [Array<Zavudev::Models::Contact::Channel>] All communication channels for this contact.
      #
      #   @param country_code [String]
      #
      #   @param default_channel [Symbol, Zavudev::Models::Contact::DefaultChannel] Preferred channel for this contact.
      #
      #   @param display_name [String] Display name for the contact.
      #
      #   @param phone_number [String] DEPRECATED: Use primaryPhone instead. Primary phone number in E.164 format.
      #
      #   @param primary_email [String] Primary email address.
      #
      #   @param primary_phone [String] Primary phone number in E.164 format.
      #
      #   @param profile_name [String, nil] Contact's WhatsApp profile name. Only available for WhatsApp contacts.
      #
      #   @param suggested_merge_with [String] ID of a contact suggested for merging.
      #
      #   @param updated_at [Time]

      class Channel < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute channel
        #   Channel type.
        #
        #   @return [Symbol, Zavudev::Models::Contact::Channel::Channel]
        required :channel, enum: -> { Zavudev::Contact::Channel::Channel }

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
        #   @return [Zavudev::Models::Contact::Channel::Metrics, nil]
        optional :metrics, -> { Zavudev::Contact::Channel::Metrics }

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, channel:, created_at:, identifier:, is_primary:, verified:, country_code: nil, label: nil, last_inbound_at: nil, metadata: nil, metrics: nil, updated_at: nil)
        #   A communication channel for a contact.
        #
        #   @param id [String]
        #
        #   @param channel [Symbol, Zavudev::Models::Contact::Channel::Channel] Channel type.
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
        #   @param metrics [Zavudev::Models::Contact::Channel::Metrics] Delivery metrics for this channel.
        #
        #   @param updated_at [Time]

        # Channel type.
        #
        # @see Zavudev::Models::Contact::Channel#channel
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

        # @see Zavudev::Models::Contact::Channel#metrics
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

      # Preferred channel for this contact.
      #
      # @see Zavudev::Models::Contact#default_channel
      module DefaultChannel
        extend Zavudev::Internal::Type::Enum

        SMS = :sms
        WHATSAPP = :whatsapp
        TELEGRAM = :telegram
        EMAIL = :email
        INSTAGRAM = :instagram
        VOICE = :voice

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
