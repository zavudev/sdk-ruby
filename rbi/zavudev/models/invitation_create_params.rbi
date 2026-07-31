# typed: strong

module Zavudev
  module Models
    class InvitationCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::InvitationCreateParams, Zavudev::Internal::AnyHash)
        end

      # ISO country codes for allowed phone numbers. Only valid when `connectionType` is
      # `whatsapp_waba` — sending it with `messenger` returns 400.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :allowed_phone_countries

      sig { params(allowed_phone_countries: T::Array[String]).void }
      attr_writer :allowed_phone_countries

      # Email of the client being invited.
      sig { returns(T.nilable(String)) }
      attr_reader :client_email

      sig { params(client_email: String).void }
      attr_writer :client_email

      # Name of the client being invited.
      sig { returns(T.nilable(String)) }
      attr_reader :client_name

      sig { params(client_name: String).void }
      attr_writer :client_name

      # Phone number of the client in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :client_phone

      sig { params(client_phone: String).void }
      attr_writer :client_phone

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
      sig do
        returns(
          T.nilable(Zavudev::InvitationCreateParams::ConnectionType::OrSymbol)
        )
      end
      attr_reader :connection_type

      sig do
        params(
          connection_type:
            Zavudev::InvitationCreateParams::ConnectionType::OrSymbol
        ).void
      end
      attr_writer :connection_type

      # Number of days until the invitation expires.
      sig { returns(T.nilable(Integer)) }
      attr_reader :expires_in_days

      sig { params(expires_in_days: Integer).void }
      attr_writer :expires_in_days

      # ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      # the client will use this number instead of their own. Only valid when
      # `connectionType` is `whatsapp_waba` — sending it with `messenger` returns 400,
      # since a Facebook Page has no phone number.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number_id

      sig { params(phone_number_id: String).void }
      attr_writer :phone_number_id

      sig do
        params(
          allowed_phone_countries: T::Array[String],
          client_email: String,
          client_name: String,
          client_phone: String,
          connection_type:
            Zavudev::InvitationCreateParams::ConnectionType::OrSymbol,
          expires_in_days: Integer,
          phone_number_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ISO country codes for allowed phone numbers. Only valid when `connectionType` is
        # `whatsapp_waba` — sending it with `messenger` returns 400.
        allowed_phone_countries: nil,
        # Email of the client being invited.
        client_email: nil,
        # Name of the client being invited.
        client_name: nil,
        # Phone number of the client in E.164 format.
        client_phone: nil,
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
        connection_type: nil,
        # Number of days until the invitation expires.
        expires_in_days: nil,
        # ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
        # the client will use this number instead of their own. Only valid when
        # `connectionType` is `whatsapp_waba` — sending it with `messenger` returns 400,
        # since a Facebook Page has no phone number.
        phone_number_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            allowed_phone_countries: T::Array[String],
            client_email: String,
            client_name: String,
            client_phone: String,
            connection_type:
              Zavudev::InvitationCreateParams::ConnectionType::OrSymbol,
            expires_in_days: Integer,
            phone_number_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

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

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::InvitationCreateParams::ConnectionType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WHATSAPP_WABA =
          T.let(
            :whatsapp_waba,
            Zavudev::InvitationCreateParams::ConnectionType::TaggedSymbol
          )
        MESSENGER =
          T.let(
            :messenger,
            Zavudev::InvitationCreateParams::ConnectionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Zavudev::InvitationCreateParams::ConnectionType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
