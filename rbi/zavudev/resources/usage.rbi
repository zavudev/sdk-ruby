# typed: strong

module Zavudev
  module Resources
    class Usage
      # Get the current month's usage counters for A2P messages and emails, along with
      # the tier limits.
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::UsageRetrieveResponse
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
