# frozen_string_literal: true

module Zavudev
  module Resources
    class URLs
      # List URLs that have been verified for this project.
      #
      # @overload list_verified(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String]
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::URLListVerifiedParams::Status] Filter by verification status.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::VerifiedURL>]
      #
      # @see Zavudev::Models::URLListVerifiedParams
      def list_verified(params = {})
        parsed, options = Zavudev::URLListVerifiedParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/urls",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::VerifiedURL,
          options: options
        )
      end

      # Get details of a specific verified URL.
      #
      # @overload retrieve_details(url_id, request_options: {})
      #
      # @param url_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::URLRetrieveDetailsResponse]
      #
      # @see Zavudev::Models::URLRetrieveDetailsParams
      def retrieve_details(url_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/urls/%1$s", url_id],
          model: Zavudev::Models::URLRetrieveDetailsResponse,
          options: params[:request_options]
        )
      end

      # Submit a URL for verification. URLs are automatically checked against Google Web
      # Risk API. Safe URLs are auto-approved, malicious URLs are blocked. URL
      # shorteners (bit.ly, t.co, etc.) are always blocked.
      #
      # **Important:** All SMS and Email messages containing URLs require those URLs to
      # be verified before the message can be sent. This endpoint allows
      # pre-verification of URLs.
      #
      # @overload submit_for_verification(url:, request_options: {})
      #
      # @param url [String] The URL to submit for verification.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::URLSubmitForVerificationResponse]
      #
      # @see Zavudev::Models::URLSubmitForVerificationParams
      def submit_for_verification(params)
        parsed, options = Zavudev::URLSubmitForVerificationParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/urls",
          body: parsed,
          model: Zavudev::Models::URLSubmitForVerificationResponse,
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
