# frozen_string_literal: true

module Zavudev
  module Resources
    class Contacts
      # Get contact
      #
      # @overload retrieve(contact_id, request_options: {})
      #
      # @param contact_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Contact]
      #
      # @see Zavudev::Models::ContactRetrieveParams
      def retrieve(contact_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/contacts/%1$s", contact_id],
          model: Zavudev::Contact,
          options: params[:request_options]
        )
      end

      # Update contact
      #
      # @overload update(contact_id, default_channel: nil, metadata: nil, request_options: {})
      #
      # @param contact_id [String]
      #
      # @param default_channel [Symbol, Zavudev::Models::ContactUpdateParams::DefaultChannel, nil] Preferred channel for this contact. Set to null to clear.
      #
      # @param metadata [Hash{Symbol=>String}]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Contact]
      #
      # @see Zavudev::Models::ContactUpdateParams
      def update(contact_id, params = {})
        parsed, options = Zavudev::ContactUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/contacts/%1$s", contact_id],
          body: parsed,
          model: Zavudev::Contact,
          options: options
        )
      end

      # List contacts with their communication channels.
      #
      # @overload list(cursor: nil, limit: nil, phone_number: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param phone_number [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Contact>]
      #
      # @see Zavudev::Models::ContactListParams
      def list(params = {})
        parsed, options = Zavudev::ContactListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/contacts",
          query: query.transform_keys(phone_number: "phoneNumber"),
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Contact,
          options: options
        )
      end

      # Get contact by phone number
      #
      # @overload retrieve_by_phone(phone_number, request_options: {})
      #
      # @param phone_number [String] E.164 phone number.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Contact]
      #
      # @see Zavudev::Models::ContactRetrieveByPhoneParams
      def retrieve_by_phone(phone_number, params = {})
        @client.request(
          method: :get,
          path: ["v1/contacts/phone/%1$s", phone_number],
          model: Zavudev::Contact,
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
