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
      #   @return [Array<Zavudev::Models::ContactChannel>, nil]
      optional :channels, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::ContactChannel] }

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
      #   @param channels [Array<Zavudev::Models::ContactChannel>] All communication channels for this contact.
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
