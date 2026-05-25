# frozen_string_literal: true

module Zavudev
  module Resources
    class Me
      # Returns the project, team, and API key metadata bound to the current Bearer
      # token. Used by CLIs and SDKs to confirm which project they will operate on.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::MeRetrieveResponse]
      #
      # @see Zavudev::Models::MeRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/me",
          model: Zavudev::Models::MeRetrieveResponse,
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
