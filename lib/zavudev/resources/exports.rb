# frozen_string_literal: true

module Zavudev
  module Resources
    class Exports
      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
