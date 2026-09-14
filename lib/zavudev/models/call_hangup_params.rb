# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Calls#hangup
    class CallHangupParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute call_id
      #
      #   @return [String]
      required :call_id, String

      # @!method initialize(call_id:, request_options: {})
      #   @param call_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
