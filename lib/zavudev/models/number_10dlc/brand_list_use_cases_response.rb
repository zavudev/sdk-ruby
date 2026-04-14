# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#list_use_cases
      class BrandListUseCasesResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute use_cases
        #
        #   @return [Array<Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase>]
        required :use_cases,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase] },
                 api_name: :useCases

        # @!method initialize(use_cases:)
        #   @param use_cases [Array<Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase>]

        class UseCase < Zavudev::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(description: nil, name: nil)
          #   @param description [String]
          #   @param name [String]
        end
      end
    end
  end
end
