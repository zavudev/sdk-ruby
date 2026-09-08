# frozen_string_literal: true

module Zavudev
  module Resources
    class EmailDomains
      # Add a domain to send email from. Returns the DNS records to publish (DKIM CNAMEs
      # are required; SPF, DMARC, and MAIL FROM are recommended). Publish them at your
      # DNS provider, then verify.
      #
      # @overload create(domain:, request_options: {})
      #
      # @param domain [String] Bare domain, e.g. example.com.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::EmailDomainCreateResponse]
      #
      # @see Zavudev::Models::EmailDomainCreateParams
      def create(params)
        parsed, options = Zavudev::EmailDomainCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/email-domains",
          body: parsed,
          model: Zavudev::Models::EmailDomainCreateResponse,
          options: options
        )
      end

      # Fetch a domain with its DNS records and current status.
      #
      # @overload retrieve(domain_id, request_options: {})
      #
      # @param domain_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::EmailDomainRetrieveResponse]
      #
      # @see Zavudev::Models::EmailDomainRetrieveParams
      def retrieve(domain_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/email-domains/%1$s", domain_id],
          model: Zavudev::Models::EmailDomainRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List email domains
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::EmailDomainListResponse]
      #
      # @see Zavudev::Models::EmailDomainListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/email-domains",
          model: Zavudev::Models::EmailDomainListResponse,
          options: params[:request_options]
        )
      end

      # Remove an email domain
      #
      # @overload delete(domain_id, request_options: {})
      #
      # @param domain_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::EmailDomainDeleteParams
      def delete(domain_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/email-domains/%1$s", domain_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Re-check the domain's published DNS records and refresh its status.
      #
      # @overload verify(domain_id, request_options: {})
      #
      # @param domain_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::EmailDomainVerifyResponse]
      #
      # @see Zavudev::Models::EmailDomainVerifyParams
      def verify(domain_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/email-domains/%1$s/verify", domain_id],
          model: Zavudev::Models::EmailDomainVerifyResponse,
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
