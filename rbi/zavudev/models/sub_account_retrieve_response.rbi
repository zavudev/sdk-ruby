# typed: strong

module Zavudev
  module Models
    class SubAccountRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::SubAccountRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::SubAccount) }
      attr_reader :sub_account

      sig { params(sub_account: Zavudev::SubAccount::OrHash).void }
      attr_writer :sub_account

      sig do
        params(sub_account: Zavudev::SubAccount::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(sub_account:)
      end

      sig { override.returns({ sub_account: Zavudev::SubAccount }) }
      def to_hash
      end
    end
  end
end
