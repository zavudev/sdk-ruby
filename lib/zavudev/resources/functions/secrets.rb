# frozen_string_literal: true

module Zavudev
  module Resources
    class Functions
      class Secrets
        # Lists every secret key set on the function. Plaintext is NEVER returned — only
        # the last 4 characters of each value, for visual confirmation.
        #
        # @overload list(function_id, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::SecretListResponse]
        #
        # @see Zavudev::Models::Functions::SecretListParams
        def list(function_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/functions/%1$s/secrets", function_id],
            model: Zavudev::Models::Functions::SecretListResponse,
            options: params[:request_options]
          )
        end

        # Create or update a secret on a function. Marks the function out-of-sync; the
        # next `POST /deploy` re-publishes the Lambda with the new env. Keys must match
        # `[A-Z_][A-Z0-9_]*` (uppercase env-var style) and cannot start with reserved
        # prefixes (AWS*, LAMBDA*, etc).
        #
        # @overload set(key, function_id:, value:, request_options: {})
        #
        # @param key [String] Path param
        #
        # @param function_id [String] Path param: Zavu Function ID.
        #
        # @param value [String] Body param
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Object]
        #
        # @see Zavudev::Models::Functions::SecretSetParams
        def set(key, params)
          parsed, options = Zavudev::Functions::SecretSetParams.dump_request(params)
          function_id =
            parsed.delete(:function_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["v1/functions/%1$s/secrets/%2$s", function_id, key],
            body: parsed,
            model: Zavudev::Internal::Type::Unknown,
            options: options
          )
        end

        # Remove a secret from a function. Doesn't take effect on the running Lambda until
        # the next deploy.
        #
        # @overload unset(key, function_id:, request_options: {})
        #
        # @param key [String]
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Functions::SecretUnsetParams
        def unset(key, params)
          parsed, options = Zavudev::Functions::SecretUnsetParams.dump_request(params)
          function_id =
            parsed.delete(:function_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/functions/%1$s/secrets/%2$s", function_id, key],
            model: NilClass,
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
end
