# typed: strong

module Zavudev
  module Resources
    class URLs
      # List URLs that have been verified for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::URLListVerifiedParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::VerifiedURL])
      end
      def list_verified(
        cursor: nil,
        limit: nil,
        # Filter by verification status.
        status: nil,
        request_options: {}
      )
      end

      # Get details of a specific verified URL.
      sig do
        params(
          url_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::URLRetrieveDetailsResponse)
      end
      def retrieve_details(url_id, request_options: {})
      end

      # Submit a URL for verification. URLs are automatically checked against Google Web
      # Risk API. Safe URLs are auto-approved, malicious URLs are blocked. URL
      # shorteners (bit.ly, t.co, etc.) are always blocked.
      #
      # **Important:** All SMS and Email messages containing URLs require those URLs to
      # be verified before the message can be sent. This endpoint allows
      # pre-verification of URLs.
      sig do
        params(
          url: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::URLSubmitForVerificationResponse)
      end
      def submit_for_verification(
        # The URL to submit for verification.
        url:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
