# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class CampaignSyncStatusParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::CampaignSyncStatusParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :campaign_id

        sig do
          params(
            campaign_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(campaign_id:, request_options: {})
        end

        sig do
          override.returns(
            { campaign_id: String, request_options: Zavudev::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
