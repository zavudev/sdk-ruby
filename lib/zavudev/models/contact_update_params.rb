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

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!method initialize(contact_id:, default_channel: nil, metadata: nil, request_options: {})
      #   @param contact_id [String]
      #
      #   @param default_channel [Symbol, Zavudev::Models::ContactUpdateParams::DefaultChannel, nil] Preferred channel for this contact. Set to null to clear.
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
        VOICE = :voice

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
