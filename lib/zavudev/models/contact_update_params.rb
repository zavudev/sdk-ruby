# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#update
    class ContactUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute contact_id
      #
      #   @return [String]
      required :contact_id, String

      # @!attribute default_channel
      #   Preferred channel for this contact. Set to null to clear.
      #
      #   @return [Symbol, Zavudev::Models::ContactUpdateParams::DefaultChannel, nil]
      optional :default_channel,
               enum: -> { Zavudev::ContactUpdateParams::DefaultChannel },
               api_name: :defaultChannel,
               nil?: true

      # @!attribute display_name
      #   Human-readable name for this contact. Set to null to clear it and fall back to
      #   the contact's identifier. Contacts created automatically from an inbound message
      #   have no display name until you set one.
      #
      #   @return [String, nil]
      optional :display_name, String, api_name: :displayName, nil?: true

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!method initialize(contact_id:, default_channel: nil, display_name: nil, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::ContactUpdateParams} for more details.
      #
      #   @param contact_id [String]
      #
      #   @param default_channel [Symbol, Zavudev::Models::ContactUpdateParams::DefaultChannel, nil] Preferred channel for this contact. Set to null to clear.
      #
      #   @param display_name [String, nil] Human-readable name for this contact. Set to null to clear it and fall back to t
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Preferred channel for this contact. Set to null to clear.
      module DefaultChannel
        extend Zavudev::Internal::Type::Enum

        SMS = :sms
        WHATSAPP = :whatsapp
        TELEGRAM = :telegram
        EMAIL = :email
        INSTAGRAM = :instagram
        MESSENGER = :messenger
        VOICE = :voice

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
