# typed: strong

module Zavudev
  module Resources
    class Invitations
      # Create a partner invitation link for a client to connect their WhatsApp Business
      # account. The client will complete Meta's embedded signup flow and the resulting
      # sender will be created in your project.
      sig do
        params(
          allowed_phone_countries: T::Array[String],
          client_email: String,
          client_name: String,
          client_phone: String,
          expires_in_days: Integer,
          phone_number_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::InvitationCreateResponse)
      end
      def create(
        # ISO country codes for allowed phone numbers.
        allowed_phone_countries: nil,
        # Email of the client being invited.
        client_email: nil,
        # Name of the client being invited.
        client_name: nil,
        # Phone number of the client in E.164 format.
        client_phone: nil,
        # Number of days until the invitation expires.
        expires_in_days: nil,
        # ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
        # the client will use this number instead of their own.
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
