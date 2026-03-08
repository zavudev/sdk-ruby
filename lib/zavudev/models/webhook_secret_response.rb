# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#regenerate_webhook_secret
    class WebhookSecretResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute secret
      #   The new webhook secret.
      #
      #   @return [String]
      required :secret, String

      # @!method initialize(secret:)
      #   @param secret [String] The new webhook secret.
    end
  end
end
