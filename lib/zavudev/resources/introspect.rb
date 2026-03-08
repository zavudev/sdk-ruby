# frozen_string_literal: true

module Zavudev
  module Resources
    class Introspect
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
