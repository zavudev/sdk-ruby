# typed: strong

module Zavudev
  module Resources
    class SubAccounts
      sig { returns(Zavudev::Resources::SubAccounts::APIKeys) }
      attr_reader :api_keys

      # Create a new sub-account (project) with its own API key. All charges are billed
      # to the parent team's balance. Use creditLimit to set a spending cap. The
      # sub-account's API key is returned only in the creation response.
      sig do
        params(
          name: String,
          credit_limit: Integer,
          external_id: String,
          metadata: T::Hash[Symbol, T.anything],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SubAccountCreateResponse)
      end
      def create(
        # Name of the sub-account.
        name:,
        # Spending cap in cents. When reached, messages from this sub-account will be
        # blocked. Omit or set to 0 for no limit.
        credit_limit: nil,
        # External reference ID for your own tracking.
        external_id: nil,
        metadata: nil,
        request_options: {}
      )
      end

      # Get sub-account
      sig do
        params(
          id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SubAccountRetrieveResponse)
      end
      def retrieve(
        # Sub-account ID.
        id,
        request_options: {}
      )
      end

      # Update sub-account
      sig do
        params(
          id: String,
          credit_limit: T.nilable(Integer),
          external_id: String,
          metadata: T::Hash[Symbol, T.anything],
          name: String,
          status: Zavudev::SubAccountUpdateParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SubAccountUpdateResponse)
      end
      def update(
        # Sub-account ID.
        id,
        credit_limit: nil,
        external_id: nil,
        metadata: nil,
        name: nil,
        status: nil,
        request_options: {}
      )
      end

      # List sub-accounts for this team.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::SubAccount])
      end
      def list(cursor: nil, limit: nil, request_options: {})
      end

      # Deactivate a sub-account. Remaining balance is returned to the parent team and
      # all API keys are revoked.
      sig do
        params(
          id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SubAccountDeactivateResponse)
      end
      def deactivate(
        # Sub-account ID.
        id,
        request_options: {}
      )
      end

      # Get spending information for a sub-account. Returns the parent team's balance,
      # the sub-account's total spending, and its credit limit (spending cap).
      sig do
        params(
          id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SubAccountGetBalanceResponse)
      end
      def get_balance(
        # Sub-account ID.
        id,
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
