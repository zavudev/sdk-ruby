# frozen_string_literal: true

module Zavudev
  module Resources
    class SubAccounts
      class APIKeys
        # Create sub-account API key
        #
        # @overload create(id, name:, environment: nil, permissions: nil, request_options: {})
        #
        # @param id [String] Sub-account ID.
        #
        # @param name [String]
        #
        # @param environment [Symbol, Zavudev::Models::SubAccounts::APIKeyCreateParams::Environment]
        #
        # @param permissions [Array<String>]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::SubAccounts::APIKeyCreateResponse]
        #
        # @see Zavudev::Models::SubAccounts::APIKeyCreateParams
        def create(id, params)
          parsed, options = Zavudev::SubAccounts::APIKeyCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/sub-accounts/%1$s/api-keys", id],
            body: parsed,
            model: Zavudev::Models::SubAccounts::APIKeyCreateResponse,
            options: options
          )
        end

        # List sub-account API keys
        #
        # @overload list(id, request_options: {})
        #
        # @param id [String] Sub-account ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::SubAccounts::APIKeyListResponse]
        #
        # @see Zavudev::Models::SubAccounts::APIKeyListParams
        def list(id, params = {})
          @client.request(
            method: :get,
            path: ["v1/sub-accounts/%1$s/api-keys", id],
            model: Zavudev::Models::SubAccounts::APIKeyListResponse,
            options: params[:request_options]
          )
        end

        # Revoke sub-account API key
        #
        # @overload revoke(key_id, id:, request_options: {})
        #
        # @param key_id [String] API key ID.
        #
        # @param id [String] Sub-account ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::SubAccounts::APIKeyRevokeParams
        def revoke(key_id, params)
          parsed, options = Zavudev::SubAccounts::APIKeyRevokeParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/sub-accounts/%1$s/api-keys/%2$s", id, key_id],
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
