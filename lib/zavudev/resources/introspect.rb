# frozen_string_literal: true

module Zavudev
  module Resources
    class Introspect
      # Heuristic email validation to run before sending: catches invalid syntax, dead
      # domains (no MX/A records), disposable inboxes, role-based addresses (info@,
      # contacto@, sales@), and addresses already on your project's suppression list.
      # Use it to clean a list before a broadcast and keep your bounce rate low.
      #
      # No mailbox-level (SMTP) probe is performed, so a `deliverable` verdict is not a
      # delivery guarantee — it means no negative signal was found. Treat `risky`
      # addresses with care and drop `undeliverable` ones.
      #
      # Accepts a single `email` or an `emails` batch (max 100 per request).
      #
      # @overload validate_email(email: nil, emails: nil, request_options: {})
      #
      # @param email [String] Single email address to validate.
      #
      # @param emails [Array<String>] Batch of email addresses to validate (max 100).
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::IntrospectValidateEmailResponse]
      #
      # @see Zavudev::Models::IntrospectValidateEmailParams
      def validate_email(params = {})
        parsed, options = Zavudev::IntrospectValidateEmailParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/introspect/email",
          body: parsed,
          model: Zavudev::Models::IntrospectValidateEmailResponse,
          options: options
        )
      end

      # Validate a phone number and check if a WhatsApp conversation window is open.
      #
      # @overload validate_phone(phone_number:, request_options: {})
      #
      # @param phone_number [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::IntrospectValidatePhoneResponse]
      #
      # @see Zavudev::Models::IntrospectValidatePhoneParams
      def validate_phone(params)
        parsed, options = Zavudev::IntrospectValidatePhoneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/introspect/phone",
          body: parsed,
          model: Zavudev::Models::IntrospectValidatePhoneResponse,
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
