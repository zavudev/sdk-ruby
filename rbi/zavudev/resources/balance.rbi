# typed: strong

module Zavudev
  module Resources
    class Balance
      # Get balance for the API key's team. If the API key belongs to a sub-account,
      # also includes the sub-account's total spending and credit limit.
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::BalanceRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
