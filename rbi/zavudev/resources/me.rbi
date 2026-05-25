# typed: strong

module Zavudev
  module Resources
    class Me
      # Returns the project, team, and API key metadata bound to the current Bearer
      # token. Used by CLIs and SDKs to confirm which project they will operate on.
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::MeRetrieveResponse
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
