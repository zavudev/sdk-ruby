# frozen_string_literal: true

module Zavudev
  module Resources
    class Balance
      # Get balance for the API key's team. If the API key belongs to a sub-account,
      # also includes the sub-account's total spending and credit limit.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BalanceRetrieveResponse]
      #
      # @see Zavudev::Models::BalanceRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/balance",
          model: Zavudev::Models::BalanceRetrieveResponse,
          options: params[:request_options]
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
