# frozen_string_literal: true

module Zavudev
  module Models
    module Contacts
      # @see Zavudev::Resources::Contacts::Channels#add
      class ChannelAddParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute contact_id
        #
        #   @return [String]
        required :contact_id, String

        # @!attribute channel
        #   Channel type.
        #
        #   @return [Symbol, Zavudev::Models::Contacts::ChannelAddParams::Channel]
        required :channel, enum: -> { Zavudev::Contacts::ChannelAddParams::Channel }

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

        # @!method initialize(contact_id:, channel:, identifier:, country_code: nil, is_primary: nil, label: nil, request_options: {})
        #   @param contact_id [String]
        #
        #   @param channel [Symbol, Zavudev::Models::Contacts::ChannelAddParams::Channel] Channel type.
        #
        #   @param identifier [String] Channel identifier (phone number in E.164 format or email address).
        #
        #   @param country_code [String] ISO country code for phone numbers.
        #
        #   @param is_primary [Boolean] Whether this should be the primary channel for its type.
        #
        #   @param label [String] Optional label for the channel.
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

        # Channel type.
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
