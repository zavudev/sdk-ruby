# frozen_string_literal: true

module Zavudev
  module Resources
    class SubAccounts
      # @return [Zavudev::Resources::SubAccounts::APIKeys]
      attr_reader :api_keys

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::SubAccountCreateParams} for more details.
      #
      # Create a new sub-account (project) with its own API key. All charges are billed
      # to the parent team's balance. Use creditLimit to set a spending cap. The
      # sub-account's API key is returned only in the creation response.
      #
      # @overload create(name:, credit_limit: nil, external_id: nil, metadata: nil, request_options: {})
      #
      # @param name [String] Name of the sub-account.
      #
      # @param credit_limit [Integer] Spending cap in cents. When reached, messages from this sub-account will be bloc
      #
      # @param external_id [String] External reference ID for your own tracking.
      #
      # @param metadata [Hash{Symbol=>Object}]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SubAccountCreateResponse]
      #
      # @see Zavudev::Models::SubAccountCreateParams
      def create(params)
        parsed, options = Zavudev::SubAccountCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/sub-accounts",
          body: parsed,
          model: Zavudev::Models::SubAccountCreateResponse,
          options: options
        )
      end

      # Get sub-account
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Sub-account ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SubAccountRetrieveResponse]
      #
      # @see Zavudev::Models::SubAccountRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v1/sub-accounts/%1$s", id],
          model: Zavudev::Models::SubAccountRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update sub-account
      #
      # @overload update(id, credit_limit: nil, external_id: nil, metadata: nil, name: nil, status: nil, request_options: {})
      #
      # @param id [String] Sub-account ID.
      #
      # @param credit_limit [Integer, nil]
      #
      # @param external_id [String]
      #
      # @param metadata [Hash{Symbol=>Object}]
      #
      # @param name [String]
      #
      # @param status [Symbol, Zavudev::Models::SubAccountUpdateParams::Status]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SubAccountUpdateResponse]
      #
      # @see Zavudev::Models::SubAccountUpdateParams
      def update(id, params = {})
        parsed, options = Zavudev::SubAccountUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/sub-accounts/%1$s", id],
          body: parsed,
          model: Zavudev::Models::SubAccountUpdateResponse,
          options: options
        )
      end

      # List sub-accounts for this team.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::SubAccount>]
      #
      # @see Zavudev::Models::SubAccountListParams
      def list(params = {})
        parsed, options = Zavudev::SubAccountListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/sub-accounts",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::SubAccount,
          options: options
        )
      end

      # Deactivate a sub-account. Remaining balance is returned to the parent team and
      # all API keys are revoked.
      #
      # @overload deactivate(id, request_options: {})
      #
      # @param id [String] Sub-account ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SubAccountDeactivateResponse]
      #
      # @see Zavudev::Models::SubAccountDeactivateParams
      def deactivate(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/sub-accounts/%1$s", id],
          model: Zavudev::Models::SubAccountDeactivateResponse,
          options: params[:request_options]
        )
      end

      # Get spending information for a sub-account. Returns the parent team's balance,
      # the sub-account's total spending, and its credit limit (spending cap).
      #
      # @overload get_balance(id, request_options: {})
      #
      # @param id [String] Sub-account ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SubAccountGetBalanceResponse]
      #
      # @see Zavudev::Models::SubAccountGetBalanceParams
      def get_balance(id, params = {})
        @client.request(
          method: :get,
          path: ["v1/sub-accounts/%1$s/balance", id],
          model: Zavudev::Models::SubAccountGetBalanceResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
        @api_keys = Zavudev::Resources::SubAccounts::APIKeys.new(client: client)
      end
    end
  end
end
