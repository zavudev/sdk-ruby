# frozen_string_literal: true

module Zavudev
  module Resources
    class Contacts
      # @return [Zavudev::Resources::Contacts::Channels]
      attr_reader :channels

      # Create a new contact with one or more communication channels.
      #
      # @overload create(channels:, display_name: nil, metadata: nil, request_options: {})
      #
      # @param channels [Array<Zavudev::Models::ContactCreateParams::Channel>] Communication channels for the contact.
      #
      # @param display_name [String] Display name for the contact.
      #
      # @param metadata [Hash{Symbol=>String}] Arbitrary metadata to associate with the contact.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Contact]
      #
      # @see Zavudev::Models::ContactCreateParams
      def create(params)
        parsed, options = Zavudev::ContactCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/contacts",
          body: parsed,
          model: Zavudev::Contact,
          options: options
        )
      end

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

      # Dismiss the merge suggestion for a contact.
      #
      # @overload dismiss_merge_suggestion(contact_id, request_options: {})
      #
      # @param contact_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::ContactDismissMergeSuggestionParams
      def dismiss_merge_suggestion(contact_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/contacts/%1$s/merge-suggestion", contact_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::ContactMergeParams} for more details.
      #
      # Merge a source contact into this contact. All channels from the source contact
      # will be moved to the target contact, and the source contact will be marked as
      # merged.
      #
      # @overload merge(contact_id, source_contact_id:, request_options: {})
      #
      # @param contact_id [String]
      #
      # @param source_contact_id [String] ID of the contact to merge into the target contact. The source contact will be m
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Contact]
      #
      # @see Zavudev::Models::ContactMergeParams
      def merge(contact_id, params)
        parsed, options = Zavudev::ContactMergeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/contacts/%1$s/merge", contact_id],
          body: parsed,
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
        @channels = Zavudev::Resources::Contacts::Channels.new(client: client)
      end
    end
  end
end
