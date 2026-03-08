# frozen_string_literal: true

module Zavudev
  module Resources
    class Addresses
      # Create a regulatory address for phone number purchases. Some countries require a
      # verified address before phone numbers can be activated.
      #
      # @overload create(country_code:, locality:, postal_code:, street_address:, administrative_area: nil, business_name: nil, extended_address: nil, first_name: nil, last_name: nil, request_options: {})
      #
      # @param country_code [String]
      # @param locality [String]
      # @param postal_code [String]
      # @param street_address [String]
      # @param administrative_area [String]
      # @param business_name [String]
      # @param extended_address [String]
      # @param first_name [String]
      # @param last_name [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AddressCreateResponse]
      #
      # @see Zavudev::Models::AddressCreateParams
      def create(params)
        parsed, options = Zavudev::AddressCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/addresses",
          body: parsed,
          model: Zavudev::Models::AddressCreateResponse,
          options: options
        )
      end

      # Get a specific regulatory address.
      #
      # @overload retrieve(address_id, request_options: {})
      #
      # @param address_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AddressRetrieveResponse]
      #
      # @see Zavudev::Models::AddressRetrieveParams
      def retrieve(address_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/addresses/%1$s", address_id],
          model: Zavudev::Models::AddressRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List regulatory addresses for this project.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Address>]
      #
      # @see Zavudev::Models::AddressListParams
      def list(params = {})
        parsed, options = Zavudev::AddressListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/addresses",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Address,
          options: options
        )
      end

      # Delete a regulatory address. Cannot delete addresses that are in use.
      #
      # @overload delete(address_id, request_options: {})
      #
      # @param address_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::AddressDeleteParams
      def delete(address_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/addresses/%1$s", address_id],
          model: NilClass,
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
