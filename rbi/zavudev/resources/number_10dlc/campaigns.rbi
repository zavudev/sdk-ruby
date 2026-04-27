# typed: strong

module Zavudev
  module Resources
    class Number10dlc
      class Campaigns
        sig do
          returns(Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers)
        end
        attr_reader :phone_numbers

        # Create a 10DLC campaign under an existing brand. The campaign starts in draft
        # status. Submit it for carrier review using the submit endpoint.
        sig do
          params(
            affiliate_marketing: T::Boolean,
            age_gated: T::Boolean,
            brand_id: String,
            description: String,
            direct_lending: T::Boolean,
            embedded_link: T::Boolean,
            embedded_phone: T::Boolean,
            name: String,
            number_pooling: T::Boolean,
            sample_messages: T::Array[String],
            subscriber_help: T::Boolean,
            subscriber_opt_in: T::Boolean,
            subscriber_opt_out: T::Boolean,
            use_case: String,
            help_message: String,
            message_flow: String,
            opt_in_keywords: T::Array[String],
            opt_out_keywords: T::Array[String],
            sub_use_cases: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::CampaignCreateResponse)
        end
        def create(
          affiliate_marketing:,
          age_gated:,
          # ID of the brand to create this campaign under.
          brand_id:,
          description:,
          direct_lending:,
          embedded_link:,
          embedded_phone:,
          name:,
          number_pooling:,
          sample_messages:,
          subscriber_help:,
          subscriber_opt_in:,
          subscriber_opt_out:,
          # Campaign use case (e.g., ACCOUNT_NOTIFICATION, MARKETING, 2FA).
          use_case:,
          help_message: nil,
          message_flow: nil,
          opt_in_keywords: nil,
          opt_out_keywords: nil,
          sub_use_cases: nil,
          request_options: {}
        )
        end

        # Get 10DLC campaign
        sig do
          params(
            campaign_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::CampaignRetrieveResponse)
        end
        def retrieve(
          # 10DLC campaign ID.
          campaign_id,
          request_options: {}
        )
        end

        # Update a 10DLC campaign in draft status. Cannot update after submission.
        sig do
          params(
            campaign_id: String,
            description: String,
            help_message: String,
            message_flow: String,
            name: String,
            opt_in_keywords: T::Array[String],
            opt_out_keywords: T::Array[String],
            sample_messages: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::CampaignUpdateResponse)
        end
        def update(
          # 10DLC campaign ID.
          campaign_id,
          description: nil,
          help_message: nil,
          message_flow: nil,
          name: nil,
          opt_in_keywords: nil,
          opt_out_keywords: nil,
          sample_messages: nil,
          request_options: {}
        )
        end

        # List 10DLC campaign registrations for this project.
        sig do
          params(
            brand_id: String,
            cursor: String,
            limit: Integer,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(
            Zavudev::Internal::Cursor[Zavudev::Number10dlc::TenDlcCampaign]
          )
        end
        def list(
          # Filter campaigns by brand ID.
          brand_id: nil,
          cursor: nil,
          limit: nil,
          request_options: {}
        )
        end

        # Delete 10DLC campaign
        sig do
          params(
            campaign_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def delete(
          # 10DLC campaign ID.
          campaign_id,
          request_options: {}
        )
        end

        # Submit a draft campaign for carrier review. The campaign must be in draft status
        # and its brand must be verified.
        sig do
          params(
            campaign_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::CampaignSubmitResponse)
        end
        def submit(
          # 10DLC campaign ID.
          campaign_id,
          request_options: {}
        )
        end

        # Sync the campaign status with the registration provider. Use this to check for
        # approval updates after submission.
        sig do
          params(
            campaign_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::CampaignSyncStatusResponse)
        end
        def sync_status(
          # 10DLC campaign ID.
          campaign_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
