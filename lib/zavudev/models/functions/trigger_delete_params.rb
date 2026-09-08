# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Triggers#delete
      class TriggerDeleteParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute trigger_id
        #
        #   @return [String]
        required :trigger_id, String

        # @!method initialize(trigger_id:, request_options: {})
        #   @param trigger_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
