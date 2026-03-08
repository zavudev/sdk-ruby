# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#retrieve
    class BroadcastRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute broadcast_id
      #
      #   @return [String]
      required :broadcast_id, String

      # @!method initialize(broadcast_id:, request_options: {})
      #   @param broadcast_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
