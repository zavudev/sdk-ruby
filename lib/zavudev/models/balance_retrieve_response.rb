# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Balance#retrieve
    class BalanceRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute balance
      #   Team balance in cents. All charges are billed to the parent team.
      #
      #   @return [Integer]
      required :balance, Integer

      # @!attribute currency
      #
      #   @return [String]
      required :currency, String

      # @!attribute credit_limit
      #   Spending cap in cents (only for sub-accounts).
      #
      #   @return [Integer, nil]
      optional :credit_limit, Integer, api_name: :creditLimit, nil?: true

      # @!attribute is_sub_account
      #   Whether this API key belongs to a sub-account.
      #
      #   @return [Boolean, nil]
      optional :is_sub_account, Zavudev::Internal::Type::Boolean, api_name: :isSubAccount

      # @!attribute total_spent
      #   Total amount spent by this sub-account in cents (only for sub-accounts).
      #
      #   @return [Integer, nil]
      optional :total_spent, Integer, api_name: :totalSpent, nil?: true

      # @!method initialize(balance:, currency:, credit_limit: nil, is_sub_account: nil, total_spent: nil)
      #   @param balance [Integer] Team balance in cents. All charges are billed to the parent team.
      #
      #   @param currency [String]
      #
      #   @param credit_limit [Integer, nil] Spending cap in cents (only for sub-accounts).
      #
      #   @param is_sub_account [Boolean] Whether this API key belongs to a sub-account.
      #
      #   @param total_spent [Integer, nil] Total amount spent by this sub-account in cents (only for sub-accounts).
    end
  end
end
