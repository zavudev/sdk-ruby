# typed: strong

module Zavudev
  module Resources
    class Introspect
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
