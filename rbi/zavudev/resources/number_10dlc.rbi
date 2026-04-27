# typed: strong

module Zavudev
  module Resources
    class Number10dlc
      sig { returns(Zavudev::Resources::Number10dlc::Brands) }
      attr_reader :brands

      sig { returns(Zavudev::Resources::Number10dlc::Campaigns) }
      attr_reader :campaigns

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
