# typed: strong

module Zavudev
  module Models
    class BalanceRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::BalanceRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # Team balance in cents. All charges are billed to the parent team.
      sig { returns(Integer) }
      attr_accessor :balance

      sig { returns(String) }
      attr_accessor :currency

      # Spending cap in cents (only for sub-accounts).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :credit_limit

      # Whether this API key belongs to a sub-account.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_sub_account

      sig { params(is_sub_account: T::Boolean).void }
      attr_writer :is_sub_account

      # Total amount spent by this sub-account in cents (only for sub-accounts).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :total_spent

      sig do
        params(
          balance: Integer,
          currency: String,
          credit_limit: T.nilable(Integer),
          is_sub_account: T::Boolean,
          total_spent: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Team balance in cents. All charges are billed to the parent team.
        balance:,
        currency:,
        # Spending cap in cents (only for sub-accounts).
        credit_limit: nil,
        # Whether this API key belongs to a sub-account.
        is_sub_account: nil,
        # Total amount spent by this sub-account in cents (only for sub-accounts).
        total_spent: nil
      )
      end

      sig do
        override.returns(
          {
            balance: Integer,
            currency: String,
            credit_limit: T.nilable(Integer),
            is_sub_account: T::Boolean,
            total_spent: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
