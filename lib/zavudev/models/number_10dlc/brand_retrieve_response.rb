# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Brands#retrieve
      class BrandRetrieveResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute brand
        #
        #   @return [Zavudev::Models::Number10dlc::TenDlcBrand]
        required :brand, -> { Zavudev::Number10dlc::TenDlcBrand }

        # @!method initialize(brand:)
        #   @param brand [Zavudev::Models::Number10dlc::TenDlcBrand]
      end
    end
  end
end
