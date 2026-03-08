# frozen_string_literal: true

module Zavudev
  module Models
    class Requirement < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute action
      #
      #   @return [String]
      required :action, String

      # @!attribute country_code
      #
      #   @return [String]
      required :country_code, String, api_name: :countryCode

      # @!attribute phone_number_type
      #
      #   @return [String]
      required :phone_number_type, String, api_name: :phoneNumberType

      # @!attribute requirement_types
      #
      #   @return [Array<Zavudev::Models::RequirementType>]
      required :requirement_types,
               -> { Zavudev::Internal::Type::ArrayOf[Zavudev::RequirementType] },
               api_name: :requirementTypes

      # @!method initialize(id:, action:, country_code:, phone_number_type:, requirement_types:)
      #   A group of requirements for a specific country/phone type combination.
      #
      #   @param id [String]
      #   @param action [String]
      #   @param country_code [String]
      #   @param phone_number_type [String]
      #   @param requirement_types [Array<Zavudev::Models::RequirementType>]
    end
  end
end
