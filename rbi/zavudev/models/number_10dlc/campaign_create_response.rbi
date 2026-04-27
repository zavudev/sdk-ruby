# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class CampaignCreateResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Number10dlc::CampaignCreateResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(Zavudev::Number10dlc::TenDlcCampaign) }
        attr_reader :campaign

        sig do
          params(campaign: Zavudev::Number10dlc::TenDlcCampaign::OrHash).void
        end
        attr_writer :campaign

        sig do
          params(
            campaign: Zavudev::Number10dlc::TenDlcCampaign::OrHash
          ).returns(T.attached_class)
        end
        def self.new(campaign:)
        end

        sig do
          override.returns({ campaign: Zavudev::Number10dlc::TenDlcCampaign })
        end
        def to_hash
        end
      end
    end
  end
end
