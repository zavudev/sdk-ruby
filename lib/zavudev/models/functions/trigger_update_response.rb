# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Triggers#update
      class TriggerUpdateResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute active
        #
        #   @return [Boolean]
        required :active, Zavudev::Internal::Type::Boolean

        # @!attribute ok
        #
        #   @return [Boolean]
        required :ok, Zavudev::Internal::Type::Boolean

        # @!method initialize(active:, ok:)
        #   @param active [Boolean]
        #   @param ok [Boolean]
      end
    end
  end
end
