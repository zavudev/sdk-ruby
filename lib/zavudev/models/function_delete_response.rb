# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#delete
    class FunctionDeleteResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute deleted
      #
      #   @return [Boolean]
      required :deleted, Zavudev::Internal::Type::Boolean

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute slug
      #
      #   @return [String, nil]
      optional :slug, String

      # @!method initialize(deleted:, name: nil, slug: nil)
      #   @param deleted [Boolean]
      #   @param name [String]
      #   @param slug [String]
    end
  end
end
