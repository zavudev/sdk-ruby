# frozen_string_literal: true

module Zavudev
  module Resources
    class Contacts
      class Channels
        # Update a contact's channel properties.
        #
        # @overload update(channel_id, contact_id:, label: nil, metadata: nil, verified: nil, request_options: {})
        #
        # @param channel_id [String] Path param: Channel ID.
        #
        # @param contact_id [String] Path param
        #
        # @param label [String, nil] Body param: Optional label for the channel. Set to null to clear.
        #
        # @param metadata [Hash{Symbol=>String}] Body param
        #
        # @param verified [Boolean] Body param: Whether the channel is verified.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Contacts::ChannelUpdateResponse]
        #
        # @see Zavudev::Models::Contacts::ChannelUpdateParams
        def update(channel_id, params)
          parsed, options = Zavudev::Contacts::ChannelUpdateParams.dump_request(params)
          contact_id =
            parsed.delete(:contact_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["v1/contacts/%1$s/channels/%2$s", contact_id, channel_id],
            body: parsed,
            model: Zavudev::Models::Contacts::ChannelUpdateResponse,
            options: options
          )
        end

        # Add a new communication channel to an existing contact.
        #
        # @overload add(contact_id, channel:, identifier:, country_code: nil, is_primary: nil, label: nil, request_options: {})
        #
        # @param contact_id [String]
        #
        # @param channel [Symbol, Zavudev::Models::Contacts::ChannelAddParams::Channel] Channel type.
        #
        # @param identifier [String] Channel identifier (phone number in E.164 format or email address).
        #
        # @param country_code [String] ISO country code for phone numbers.
        #
        # @param is_primary [Boolean] Whether this should be the primary channel for its type.
        #
        # @param label [String] Optional label for the channel.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Contacts::ChannelAddResponse]
        #
        # @see Zavudev::Models::Contacts::ChannelAddParams
        def add(contact_id, params)
          parsed, options = Zavudev::Contacts::ChannelAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/contacts/%1$s/channels", contact_id],
            body: parsed,
            model: Zavudev::Models::Contacts::ChannelAddResponse,
            options: options
          )
        end

        # Remove a communication channel from a contact. Cannot remove the last channel.
        #
        # @overload remove(channel_id, contact_id:, request_options: {})
        #
        # @param channel_id [String] Channel ID.
        #
        # @param contact_id [String]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Contacts::ChannelRemoveParams
        def remove(channel_id, params)
          parsed, options = Zavudev::Contacts::ChannelRemoveParams.dump_request(params)
          contact_id =
            parsed.delete(:contact_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/contacts/%1$s/channels/%2$s", contact_id, channel_id],
            model: NilClass,
            options: options
          )
        end

        # Set a channel as the primary channel for its type.
        #
        # @overload set_primary(channel_id, contact_id:, request_options: {})
        #
        # @param channel_id [String] Channel ID.
        #
        # @param contact_id [String]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Contacts::ChannelSetPrimaryResponse]
        #
        # @see Zavudev::Models::Contacts::ChannelSetPrimaryParams
        def set_primary(channel_id, params)
          parsed, options = Zavudev::Contacts::ChannelSetPrimaryParams.dump_request(params)
          contact_id =
            parsed.delete(:contact_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/contacts/%1$s/channels/%2$s/primary", contact_id, channel_id],
            model: Zavudev::Models::Contacts::ChannelSetPrimaryResponse,
            options: options
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
end
