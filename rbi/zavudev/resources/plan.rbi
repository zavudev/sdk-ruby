# typed: strong

module Zavudev
  module Resources
    class Plan
      # Get the current subscription plan for the API key's team, including tier,
      # billing interval, and period dates.
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::PlanRetrieveResponse
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
