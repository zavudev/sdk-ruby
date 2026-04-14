# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class BrandSyncStatusParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::BrandSyncStatusParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :brand_id

        sig do
          params(
            brand_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(brand_id:, request_options: {})
        end

        sig do
          override.returns(
            { brand_id: String, request_options: Zavudev::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
