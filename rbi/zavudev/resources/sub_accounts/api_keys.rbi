# typed: strong

module Zavudev
  module Resources
    class SubAccounts
      class APIKeys
        # Create sub-account API key. Requires a parent project API key; sub-account API
        # keys receive HTTP 403.
        sig do
          params(
            id: String,
            name: String,
            environment:
              Zavudev::SubAccounts::APIKeyCreateParams::Environment::OrSymbol,
            permissions: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::SubAccounts::APIKeyCreateResponse)
        end
        def create(
          # Sub-account ID.
          id,
          name:,
          environment: nil,
          permissions: nil,
          request_options: {}
        )
        end

        # List sub-account API keys. Requires a parent project API key; sub-account API
        # keys receive HTTP 403.
        sig do
          params(
            id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::SubAccounts::APIKeyListResponse)
        end
        def list(
          # Sub-account ID.
          id,
          request_options: {}
        )
        end

        # Revoke sub-account API key. Requires a parent project API key; sub-account API
        # keys receive HTTP 403.
        sig do
          params(
            key_id: String,
            id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def revoke(
          # API key ID.
          key_id,
          # Sub-account ID.
          id:,
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
end
