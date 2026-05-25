# typed: strong

module Zavudev
  module Resources
    class Functions
      class Secrets
        # Lists every secret key set on the function. Plaintext is NEVER returned — only
        # the last 4 characters of each value, for visual confirmation.
        sig do
          params(
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::SecretListResponse)
        end
        def list(
          # Zavu Function ID.
          function_id,
          request_options: {}
        )
        end

        # Create or update a secret on a function. Marks the function out-of-sync; the
        # next `POST /deploy` re-publishes the Lambda with the new env. Keys must match
        # `[A-Z_][A-Z0-9_]*` (uppercase env-var style) and cannot start with reserved
        # prefixes (AWS*, LAMBDA*, etc).
        sig do
          params(
            key: String,
            function_id: String,
            value: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.anything)
        end
        def set(
          # Path param
          key,
          # Path param: Zavu Function ID.
          function_id:,
          # Body param
          value:,
          request_options: {}
        )
        end

        # Remove a secret from a function. Doesn't take effect on the running Lambda until
        # the next deploy.
        sig do
          params(
            key: String,
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def unset(
          key,
          # Zavu Function ID.
          function_id:,
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
