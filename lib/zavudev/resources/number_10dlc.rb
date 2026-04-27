# frozen_string_literal: true

module Zavudev
  module Resources
    class Number10dlc
      # @return [Zavudev::Resources::Number10dlc::Brands]
      attr_reader :brands

      # @return [Zavudev::Resources::Number10dlc::Campaigns]
      attr_reader :campaigns

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
        @brands = Zavudev::Resources::Number10dlc::Brands.new(client: client)
        @campaigns = Zavudev::Resources::Number10dlc::Campaigns.new(client: client)
      end
    end
  end
end
