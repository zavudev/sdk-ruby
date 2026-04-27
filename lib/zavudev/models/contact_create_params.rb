# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#create
    class ContactCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute channels
      #   Communication channels for the contact.
      #
      #   @return [Array<Zavudev::Models::ContactCreateParams::Channel>]
      required :channels, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::ContactCreateParams::Channel] }

      # @!attribute display_name
      #   Display name for the contact.
      #
      #   @return [String, nil]
      optional :display_name, String, api_name: :displayName

      # @!attribute metadata
      #   Arbitrary metadata to associate with the contact.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!method initialize(channels:, display_name: nil, metadata: nil, request_options: {})
      #   @param channels [Array<Zavudev::Models::ContactCreateParams::Channel>] Communication channels for the contact.
      #
      #   @param display_name [String] Display name for the contact.
      #
      #   @param metadata [Hash{Symbol=>String}] Arbitrary metadata to associate with the contact.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      class Channel < Zavudev::Internal::Type::BaseModel
        # @!attribute channel
        #   Channel type.
        #
        #   @return [Symbol, Zavudev::Models::ContactCreateParams::Channel::Channel]
        required :channel, enum: -> { Zavudev::ContactCreateParams::Channel::Channel }

        # @!attribute identifier
        #   Channel identifier (phone number in E.164 format or email address).
        #
        #   @return [String]
        required :identifier, String

        # @!attribute country_code
        #   ISO country code for phone numbers.
        #
        #   @return [String, nil]
        optional :country_code, String, api_name: :countryCode

        # @!attribute is_primary
        #   Whether this should be the primary channel for its type.
        #
        #   @return [Boolean, nil]
        optional :is_primary, Zavudev::Internal::Type::Boolean, api_name: :isPrimary

        # @!attribute label
        #   Optional label for the channel.
        #
        #   @return [String, nil]
        optional :label, String

        # @!method initialize(channel:, identifier:, country_code: nil, is_primary: nil, label: nil)
        #   Input for creating a contact channel.
        #
        #   @param channel [Symbol, Zavudev::Models::ContactCreateParams::Channel::Channel] Channel type.
        #
        #   @param identifier [String] Channel identifier (phone number in E.164 format or email address).
        #
        #   @param country_code [String] ISO country code for phone numbers.
        #
        #   @param is_primary [Boolean] Whether this should be the primary channel for its type.
        #
        #   @param label [String] Optional label for the channel.

        # Channel type.
        #
        # @see Zavudev::Models::ContactCreateParams::Channel#channel
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
      end
    end
  end
end
