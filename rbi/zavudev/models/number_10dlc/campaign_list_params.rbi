# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class CampaignListParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::CampaignListParams,
              Zavudev::Internal::AnyHash
            )
          end

        # Filter campaigns by brand ID.
        sig { returns(T.nilable(String)) }
        attr_reader :brand_id

        sig { params(brand_id: String).void }
        attr_writer :brand_id

        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            brand_id: String,
            cursor: String,
            limit: Integer,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter campaigns by brand ID.
          brand_id: nil,
          cursor: nil,
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              brand_id: String,
              cursor: String,
              limit: Integer,
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
