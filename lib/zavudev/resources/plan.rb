# frozen_string_literal: true

module Zavudev
  module Resources
    class Plan
      # Get the current subscription plan for the API key's team, including tier,
      # billing interval, and period dates.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::PlanRetrieveResponse]
      #
      # @see Zavudev::Models::PlanRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/plan",
          model: Zavudev::Models::PlanRetrieveResponse,
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
