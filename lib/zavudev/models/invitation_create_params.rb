# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#create
    class InvitationCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute allowed_phone_countries
      #   ISO country codes for allowed phone numbers. Only valid when `connectionType` is
      #   `whatsapp_waba` — sending it with `messenger` returns 400.
      #
      #   @return [Array<String>, nil]
      optional :allowed_phone_countries,
               Zavudev::Internal::Type::ArrayOf[String],
               api_name: :allowedPhoneCountries

      # @!attribute client_email
      #   Email of the client being invited.
      #
      #   @return [String, nil]
      optional :client_email, String, api_name: :clientEmail

      # @!attribute client_name
      #   Name of the client being invited.
      #
      #   @return [String, nil]
      optional :client_name, String, api_name: :clientName

      # @!attribute client_phone
      #   Phone number of the client in E.164 format.
      #
      #   @return [String, nil]
      optional :client_phone, String, api_name: :clientPhone

      # @!attribute connection_type
      #   Which Meta channel the client connects, and how.
      #
      #   - `whatsapp_waba` (default): Meta's embedded signup links an official WhatsApp
      #     Business Account. Accepts `phoneNumberId` and `allowedPhoneCountries`.
      #   - `messenger`: the client authorizes with Facebook and picks a Facebook Page
      #     they administer. The Page's Messenger inbox — including Marketplace chats — is
      #     routed to Zavu. They must be an admin of at least one Page. A Page can only be
      #     connected to one Zavu project at a time: if the client picks a Page that
      #     another project already connected, the newer connection wins and the older one
      #     is disconnected.
      #
      #   One invitation connects one channel. To onboard a client on several channels,
      #   create one invitation per channel; each completes into its own sender.
      #
      #   @return [Symbol, Zavudev::Models::InvitationCreateParams::ConnectionType, nil]
      optional :connection_type,
               enum: -> { Zavudev::InvitationCreateParams::ConnectionType },
               api_name: :connectionType

      # @!attribute expires_in_days
      #   Number of days until the invitation expires.
      #
      #   @return [Integer, nil]
      optional :expires_in_days, Integer, api_name: :expiresInDays

      # @!attribute phone_number_id
      #   ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      #   the client will use this number instead of their own. Only valid when
      #   `connectionType` is `whatsapp_waba` — sending it with `messenger` returns 400,
      #   since a Facebook Page has no phone number.
      #
      #   @return [String, nil]
      optional :phone_number_id, String, api_name: :phoneNumberId

      # @!method initialize(allowed_phone_countries: nil, client_email: nil, client_name: nil, client_phone: nil, connection_type: nil, expires_in_days: nil, phone_number_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::InvitationCreateParams} for more details.
      #
      #   @param allowed_phone_countries [Array<String>] ISO country codes for allowed phone numbers. Only valid when `connectionType` is
      #
      #   @param client_email [String] Email of the client being invited.
      #
      #   @param client_name [String] Name of the client being invited.
      #
      #   @param client_phone [String] Phone number of the client in E.164 format.
      #
      #   @param connection_type [Symbol, Zavudev::Models::InvitationCreateParams::ConnectionType] Which Meta channel the client connects, and how.
      #
      #   @param expires_in_days [Integer] Number of days until the invitation expires.
      #
      #   @param phone_number_id [String] ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Which Meta channel the client connects, and how.
      #
      # - `whatsapp_waba` (default): Meta's embedded signup links an official WhatsApp
      #   Business Account. Accepts `phoneNumberId` and `allowedPhoneCountries`.
      # - `messenger`: the client authorizes with Facebook and picks a Facebook Page
      #   they administer. The Page's Messenger inbox — including Marketplace chats — is
      #   routed to Zavu. They must be an admin of at least one Page. A Page can only be
      #   connected to one Zavu project at a time: if the client picks a Page that
      #   another project already connected, the newer connection wins and the older one
      #   is disconnected.
      #
      # One invitation connects one channel. To onboard a client on several channels,
      # create one invitation per channel; each completes into its own sender.
      module ConnectionType
        extend Zavudev::Internal::Type::Enum

        WHATSAPP_WABA = :whatsapp_waba
        MESSENGER = :messenger

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
