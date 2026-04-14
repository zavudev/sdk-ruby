# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class BrandSyncStatusResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Number10dlc::BrandSyncStatusResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(Zavudev::Number10dlc::TenDlcBrand) }
        attr_reader :brand

        sig { params(brand: Zavudev::Number10dlc::TenDlcBrand::OrHash).void }
        attr_writer :brand

        sig do
          params(brand: Zavudev::Number10dlc::TenDlcBrand::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(brand:)
        end

        sig { override.returns({ brand: Zavudev::Number10dlc::TenDlcBrand }) }
        def to_hash
        end
      end
    end
  end
end
