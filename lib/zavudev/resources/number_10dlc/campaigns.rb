# frozen_string_literal: true

module Zavudev
  module Resources
    class Number10dlc
      class Campaigns
        # @return [Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers]
        attr_reader :phone_numbers

        # Create a 10DLC campaign under an existing brand. The campaign starts in draft
        # status. Submit it for carrier review using the submit endpoint.
        #
        # @overload create(affiliate_marketing:, age_gated:, brand_id:, description:, direct_lending:, embedded_link:, embedded_phone:, name:, number_pooling:, sample_messages:, subscriber_help:, subscriber_opt_in:, subscriber_opt_out:, use_case:, help_message: nil, message_flow: nil, opt_in_keywords: nil, opt_out_keywords: nil, sub_use_cases: nil, request_options: {})
        #
        # @param affiliate_marketing [Boolean]
        #
        # @param age_gated [Boolean]
        #
        # @param brand_id [String] ID of the brand to create this campaign under.
        #
        # @param description [String]
        #
        # @param direct_lending [Boolean]
        #
        # @param embedded_link [Boolean]
        #
        # @param embedded_phone [Boolean]
        #
        # @param name [String]
        #
        # @param number_pooling [Boolean]
        #
        # @param sample_messages [Array<String>]
        #
        # @param subscriber_help [Boolean]
        #
        # @param subscriber_opt_in [Boolean]
        #
        # @param subscriber_opt_out [Boolean]
        #
        # @param use_case [String] Campaign use case (e.g., ACCOUNT_NOTIFICATION, MARKETING, 2FA).
        #
        # @param help_message [String]
        #
        # @param message_flow [String]
        #
        # @param opt_in_keywords [Array<String>]
        #
        # @param opt_out_keywords [Array<String>]
        #
        # @param sub_use_cases [Array<String>]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::CampaignCreateResponse]
        #
        # @see Zavudev::Models::Number10dlc::CampaignCreateParams
        def create(params)
          parsed, options = Zavudev::Number10dlc::CampaignCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/10dlc/campaigns",
            body: parsed,
            model: Zavudev::Models::Number10dlc::CampaignCreateResponse,
            options: options
          )
        end

        # Get 10DLC campaign
        #
        # @overload retrieve(campaign_id, request_options: {})
        #
        # @param campaign_id [String] 10DLC campaign ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::CampaignRetrieveResponse]
        #
        # @see Zavudev::Models::Number10dlc::CampaignRetrieveParams
        def retrieve(campaign_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/10dlc/campaigns/%1$s", campaign_id],
            model: Zavudev::Models::Number10dlc::CampaignRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Update a 10DLC campaign in draft status. Cannot update after submission.
        #
        # @overload update(campaign_id, description: nil, help_message: nil, message_flow: nil, name: nil, opt_in_keywords: nil, opt_out_keywords: nil, sample_messages: nil, request_options: {})
        #
        # @param campaign_id [String] 10DLC campaign ID.
        #
        # @param description [String]
        #
        # @param help_message [String]
        #
        # @param message_flow [String]
        #
        # @param name [String]
        #
        # @param opt_in_keywords [Array<String>]
        #
        # @param opt_out_keywords [Array<String>]
        #
        # @param sample_messages [Array<String>]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::CampaignUpdateResponse]
        #
        # @see Zavudev::Models::Number10dlc::CampaignUpdateParams
        def update(campaign_id, params = {})
          parsed, options = Zavudev::Number10dlc::CampaignUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/10dlc/campaigns/%1$s", campaign_id],
            body: parsed,
            model: Zavudev::Models::Number10dlc::CampaignUpdateResponse,
            options: options
          )
        end

        # List 10DLC campaign registrations for this project.
        #
        # @overload list(brand_id: nil, cursor: nil, limit: nil, request_options: {})
        #
        # @param brand_id [String] Filter campaigns by brand ID.
        #
        # @param cursor [String]
        #
        # @param limit [Integer]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Internal::Cursor<Zavudev::Models::Number10dlc::TenDlcCampaign>]
        #
        # @see Zavudev::Models::Number10dlc::CampaignListParams
        def list(params = {})
          parsed, options = Zavudev::Number10dlc::CampaignListParams.dump_request(params)
          query = Zavudev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/10dlc/campaigns",
            query: query.transform_keys(brand_id: "brandId"),
            page: Zavudev::Internal::Cursor,
            model: Zavudev::Number10dlc::TenDlcCampaign,
            options: options
          )
        end

        # Delete 10DLC campaign
        #
        # @overload delete(campaign_id, request_options: {})
        #
        # @param campaign_id [String] 10DLC campaign ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Number10dlc::CampaignDeleteParams
        def delete(campaign_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/10dlc/campaigns/%1$s", campaign_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Submit a draft campaign for carrier review. The campaign must be in draft status
        # and its brand must be verified.
        #
        # @overload submit(campaign_id, request_options: {})
        #
        # @param campaign_id [String] 10DLC campaign ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::CampaignSubmitResponse]
        #
        # @see Zavudev::Models::Number10dlc::CampaignSubmitParams
        def submit(campaign_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/10dlc/campaigns/%1$s/submit", campaign_id],
            model: Zavudev::Models::Number10dlc::CampaignSubmitResponse,
            options: params[:request_options]
          )
        end

        # Sync the campaign status with the registration provider. Use this to check for
        # approval updates after submission.
        #
        # @overload sync_status(campaign_id, request_options: {})
        #
        # @param campaign_id [String] 10DLC campaign ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::CampaignSyncStatusResponse]
        #
        # @see Zavudev::Models::Number10dlc::CampaignSyncStatusParams
        def sync_status(campaign_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/10dlc/campaigns/%1$s/sync", campaign_id],
            model: Zavudev::Models::Number10dlc::CampaignSyncStatusResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Zavudev::Client]
        def initialize(client:)
          @client = client
          @phone_numbers = Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers.new(client: client)
        end
      end
    end
  end
end
