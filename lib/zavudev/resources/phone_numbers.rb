# frozen_string_literal: true

module Zavudev
  module Resources
    class PhoneNumbers
      # Get details of a specific phone number.
      #
      # @overload retrieve(phone_number_id, request_options: {})
      #
      # @param phone_number_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::PhoneNumberRetrieveResponse]
      #
      # @see Zavudev::Models::PhoneNumberRetrieveParams
      def retrieve(phone_number_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/phone-numbers/%1$s", phone_number_id],
          model: Zavudev::Models::PhoneNumberRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update a phone number's name or sender assignment.
      #
      # @overload update(phone_number_id, name: nil, sender_id: nil, request_options: {})
      #
      # @param phone_number_id [String]
      #
      # @param name [String, nil] Custom name for the phone number. Set to null to clear.
      #
      # @param sender_id [String, nil] Sender ID to assign the phone number to. Set to null to unassign.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::PhoneNumberUpdateResponse]
      #
      # @see Zavudev::Models::PhoneNumberUpdateParams
      def update(phone_number_id, params = {})
        parsed, options = Zavudev::PhoneNumberUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/phone-numbers/%1$s", phone_number_id],
          body: parsed,
          model: Zavudev::Models::PhoneNumberUpdateResponse,
          options: options
        )
      end

      # List all phone numbers owned by this project.
      #
      # @overload list(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor.
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::PhoneNumberStatus] Filter by phone number status.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::OwnedPhoneNumber>]
      #
      # @see Zavudev::Models::PhoneNumberListParams
      def list(params = {})
        parsed, options = Zavudev::PhoneNumberListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/phone-numbers",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::OwnedPhoneNumber,
          options: options
        )
      end

      # Purchase an available phone number. The first US phone number is free for each
      # team.
      #
      # @overload purchase(phone_number:, name: nil, request_options: {})
      #
      # @param phone_number [String] Phone number in E.164 format.
      #
      # @param name [String] Optional custom name for the phone number.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::PhoneNumberPurchaseResponse]
      #
      # @see Zavudev::Models::PhoneNumberPurchaseParams
      def purchase(params)
        parsed, options = Zavudev::PhoneNumberPurchaseParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/phone-numbers",
          body: parsed,
          model: Zavudev::Models::PhoneNumberPurchaseResponse,
          options: options
        )
      end

      # Release a phone number. The phone number must not be assigned to a sender.
      #
      # @overload release(phone_number_id, request_options: {})
      #
      # @param phone_number_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::PhoneNumberReleaseParams
      def release(phone_number_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/phone-numbers/%1$s", phone_number_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Get regulatory requirements for purchasing phone numbers in a specific country.
      # Some countries require additional documentation (addresses, identity documents)
      # before phone numbers can be activated.
      #
      # @overload requirements(country_code:, type: nil, request_options: {})
      #
      # @param country_code [String] Two-letter ISO country code.
      #
      # @param type [Symbol, Zavudev::Models::PhoneNumberType] Type of phone number (local, mobile, tollFree).
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::PhoneNumberRequirementsResponse]
      #
      # @see Zavudev::Models::PhoneNumberRequirementsParams
      def requirements(params)
        parsed, options = Zavudev::PhoneNumberRequirementsParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/phone-numbers/requirements",
          query: query.transform_keys(country_code: "countryCode"),
          model: Zavudev::Models::PhoneNumberRequirementsResponse,
          options: options
        )
      end

      # Search for available phone numbers to purchase by country and type.
      #
      # @overload search_available(country_code:, contains: nil, limit: nil, type: nil, request_options: {})
      #
      # @param country_code [String] Two-letter ISO country code.
      #
      # @param contains [String] Search for numbers containing this string.
      #
      # @param limit [Integer] Maximum number of results to return.
      #
      # @param type [Symbol, Zavudev::Models::PhoneNumberType] Type of phone number to search for.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::PhoneNumberSearchAvailableResponse]
      #
      # @see Zavudev::Models::PhoneNumberSearchAvailableParams
      def search_available(params)
        parsed, options = Zavudev::PhoneNumberSearchAvailableParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/phone-numbers/available",
          query: query.transform_keys(country_code: "countryCode"),
          model: Zavudev::Models::PhoneNumberSearchAvailableResponse,
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
