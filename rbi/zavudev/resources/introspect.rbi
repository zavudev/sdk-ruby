# typed: strong

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
      sig do
        params(
          email: String,
          emails: T::Array[String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::IntrospectValidateEmailResponse)
      end
      def validate_email(
        # Single email address to validate.
        email: nil,
        # Batch of email addresses to validate (max 100).
        emails: nil,
        request_options: {}
      )
      end

      # Validate a phone number and check if a WhatsApp conversation window is open.
      sig do
        params(
          phone_number: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::IntrospectValidatePhoneResponse)
      end
      def validate_phone(phone_number:, request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
