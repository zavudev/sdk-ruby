# frozen_string_literal: true

module Zavudev
  module Resources
    class Usage
      # Get the current month's usage counters for A2P messages and emails, along with
      # the tier limits.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::UsageRetrieveResponse]
      #
      # @see Zavudev::Models::UsageRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/usage",
          model: Zavudev::Models::UsageRetrieveResponse,
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
