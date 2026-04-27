# frozen_string_literal: true

module Zavudev
  module Resources
    class Invitations
      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::InvitationCreateParams} for more details.
      #
      # Create a partner invitation link for a client to connect their WhatsApp Business
      # account. The client will complete Meta's embedded signup flow and the resulting
      # sender will be created in your project.
      #
      # @overload create(allowed_phone_countries: nil, client_email: nil, client_name: nil, client_phone: nil, expires_in_days: nil, phone_number_id: nil, request_options: {})
      #
      # @param allowed_phone_countries [Array<String>] ISO country codes for allowed phone numbers.
      #
      # @param client_email [String] Email of the client being invited.
      #
      # @param client_name [String] Name of the client being invited.
      #
      # @param client_phone [String] Phone number of the client in E.164 format.
      #
      # @param expires_in_days [Integer] Number of days until the invitation expires.
      #
      # @param phone_number_id [String] ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::InvitationCreateResponse]
      #
      # @see Zavudev::Models::InvitationCreateParams
      def create(params = {})
        parsed, options = Zavudev::InvitationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/invitations",
          body: parsed,
          model: Zavudev::Models::InvitationCreateResponse,
          options: options
        )
      end

      # Get invitation
      #
      # @overload retrieve(invitation_id, request_options: {})
      #
      # @param invitation_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::InvitationRetrieveResponse]
      #
      # @see Zavudev::Models::InvitationRetrieveParams
      def retrieve(invitation_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/invitations/%1$s", invitation_id],
          model: Zavudev::Models::InvitationRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List partner invitations for this project.
      #
      # @overload list(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String]
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::InvitationListParams::Status] Current status of the partner invitation.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Invitation>]
      #
      # @see Zavudev::Models::InvitationListParams
      def list(params = {})
        parsed, options = Zavudev::InvitationListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/invitations",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Invitation,
          options: options
        )
      end

      # Cancel an active invitation. The client will no longer be able to use the
      # invitation link.
      #
      # @overload cancel(invitation_id, request_options: {})
      #
      # @param invitation_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::InvitationCancelResponse]
      #
      # @see Zavudev::Models::InvitationCancelParams
      def cancel(invitation_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/invitations/%1$s/cancel", invitation_id],
          model: Zavudev::Models::InvitationCancelResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
