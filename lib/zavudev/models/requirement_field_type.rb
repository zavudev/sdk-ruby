# frozen_string_literal: true

module Zavudev
  module Models
    # Type of requirement field.
    module RequirementFieldType
      extend Zavudev::Internal::Type::Enum

      TEXTUAL = :textual
      ADDRESS = :address
      DOCUMENT = :document
      ACTION = :action

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
