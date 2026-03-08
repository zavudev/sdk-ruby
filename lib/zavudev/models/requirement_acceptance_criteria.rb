# frozen_string_literal: true

module Zavudev
  module Models
    class RequirementAcceptanceCriteria < Zavudev::Internal::Type::BaseModel
      # @!attribute allowed_values
      #
      #   @return [Array<String>, nil]
      optional :allowed_values, Zavudev::Internal::Type::ArrayOf[String], api_name: :allowedValues, nil?: true

      # @!attribute max_length
      #
      #   @return [Integer, nil]
      optional :max_length, Integer, api_name: :maxLength, nil?: true

      # @!attribute min_length
      #
      #   @return [Integer, nil]
      optional :min_length, Integer, api_name: :minLength, nil?: true

      # @!attribute regex_pattern
      #
      #   @return [String, nil]
      optional :regex_pattern, String, api_name: :regexPattern, nil?: true

      # @!method initialize(allowed_values: nil, max_length: nil, min_length: nil, regex_pattern: nil)
      #   Acceptance criteria for a requirement.
      #
      #   @param allowed_values [Array<String>, nil]
      #   @param max_length [Integer, nil]
      #   @param min_length [Integer, nil]
      #   @param regex_pattern [String, nil]
    end
  end
end
