# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#test_
        class ToolTestResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute scheduled
          #
          #   @return [Boolean]
          required :scheduled, Zavudev::Internal::Type::Boolean

          # @!method initialize(scheduled:)
          #   @param scheduled [Boolean]
        end
      end
    end
  end
end
