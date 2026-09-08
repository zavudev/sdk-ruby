# typed: strong

module Zavudev
  module Resources
    class EmailDomains
      # Add a domain to send email from. Returns the DNS records to publish (DKIM CNAMEs
      # are required; SPF, DMARC, and MAIL FROM are recommended). Publish them at your
      # DNS provider, then verify.
      sig do
        params(
          domain: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::EmailDomainCreateResponse)
      end
      def create(
        # Bare domain, e.g. example.com.
        domain:,
        request_options: {}
      )
      end

      # Fetch a domain with its DNS records and current status.
      sig do
        params(
          domain_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::EmailDomainRetrieveResponse)
      end
      def retrieve(domain_id, request_options: {})
      end

      # List email domains
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::EmailDomainListResponse
        )
      end
      def list(request_options: {})
      end

      # Remove an email domain
      sig do
        params(
          domain_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(domain_id, request_options: {})
      end

      # Re-check the domain's published DNS records and refresh its status.
      sig do
        params(
          domain_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::EmailDomainVerifyResponse)
      end
      def verify(domain_id, request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
