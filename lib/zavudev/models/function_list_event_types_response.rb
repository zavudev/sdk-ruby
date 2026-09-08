# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#list_event_types
    class FunctionListEventTypesResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute events
      #
      #   @return [Array<String>]
      required :events, Zavudev::Internal::Type::ArrayOf[String]

      # @!method initialize(events:)
      #   @param events [Array<String>]
    end
  end
end
