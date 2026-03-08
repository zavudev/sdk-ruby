# typed: strong

module Zavudev
  module Models
    class WebhookSecretResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::WebhookSecretResponse, Zavudev::Internal::AnyHash)
        end

      # The new webhook secret.
      sig { returns(String) }
      attr_accessor :secret

      sig { params(secret: String).returns(T.attached_class) }
      def self.new(
        # The new webhook secret.
        secret:
      )
      end

      sig { override.returns({ secret: String }) }
      def to_hash
      end
    end
  end
end
