# typed: strong

module Zavudev
  module Resources
    class Invitations
      # Create a partner invitation link for a client to connect a Meta channel. The
      # client opens the returned `url` and authorizes with Meta; the resulting sender
      # is created in your project when they finish, and the invitation transitions to
      # `completed`.
      #
      # `connectionType` picks the channel:
      #
      # - `whatsapp_waba` (default): Meta's embedded signup links an official WhatsApp
      #   Business Account.
      # - `messenger`: the client picks a Facebook Page they administer; its Messenger
      #   inbox (including Marketplace chats) is routed to Zavu.
      #
      # One invitation connects one channel — create one per channel to onboard a client
      # on several. `phoneNumberId` and `allowedPhoneCountries` apply to `whatsapp_waba`
      # only.
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
        ).returns(Zavudev::Models::InvitationCreateResponse)
      end
      def create(
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

      # Get invitation
      sig do
        params(
          invitation_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::InvitationRetrieveResponse)
      end
      def retrieve(invitation_id, request_options: {})
      end

      # List partner invitations for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::InvitationListParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Invitation])
      end
      def list(
        cursor: nil,
        limit: nil,
        # Current status of the partner invitation.
        #
        # `failed` means the client started the connection and it did not finish (they
        # cancelled Meta's dialog, denied a permission, or abandoned the tab). A failed
        # invitation is still usable: the same link can be retried, and it moves back to
        # `in_progress` when the client tries again.
        status: nil,
        request_options: {}
      )
      end

      # Cancel an active invitation. The client will no longer be able to use the
      # invitation link.
      sig do
        params(
          invitation_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::InvitationCancelResponse)
      end
      def cancel(invitation_id, request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
