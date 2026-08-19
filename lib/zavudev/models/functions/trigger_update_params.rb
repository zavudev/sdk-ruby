# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Triggers#update
      class TriggerUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute trigger_id
        #
        #   @return [String]
        required :trigger_id, String

        # @!attribute active
        #
        #   @return [Boolean]
        required :active, Zavudev::Internal::Type::Boolean

        # @!method initialize(trigger_id:, active:, request_options: {})
        #   @param trigger_id [String]
        #   @param active [Boolean]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
