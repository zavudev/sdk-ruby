# frozen_string_literal: true

module Zavudev
  module Resources
    class Number10dlc
      class Campaigns
        class PhoneNumbers
          # List phone numbers assigned to a 10DLC campaign.
          #
          # @overload list(campaign_id, request_options: {})
          #
          # @param campaign_id [String] 10DLC campaign ID.
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Number10dlc::Campaigns::PhoneNumberListResponse]
          #
          # @see Zavudev::Models::Number10dlc::Campaigns::PhoneNumberListParams
          def list(campaign_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/10dlc/campaigns/%1$s/phone-numbers", campaign_id],
              model: Zavudev::Models::Number10dlc::Campaigns::PhoneNumberListResponse,
              options: params[:request_options]
            )
          end

          # Assign a US phone number to an approved 10DLC campaign. The campaign must be in
          # approved status.
          #
          # @overload assign(campaign_id, phone_number_id:, request_options: {})
          #
          # @param campaign_id [String] 10DLC campaign ID.
          #
          # @param phone_number_id [String] ID of the phone number to assign.
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Number10dlc::Campaigns::PhoneNumberAssignResponse]
          #
          # @see Zavudev::Models::Number10dlc::Campaigns::PhoneNumberAssignParams
          def assign(campaign_id, params)
            parsed, options = Zavudev::Number10dlc::Campaigns::PhoneNumberAssignParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/10dlc/campaigns/%1$s/phone-numbers", campaign_id],
              body: parsed,
              model: Zavudev::Models::Number10dlc::Campaigns::PhoneNumberAssignResponse,
              options: options
            )
          end

          # Remove a phone number assignment from a 10DLC campaign.
          #
          # @overload unassign(assignment_id, campaign_id:, request_options: {})
          #
          # @param assignment_id [String] Phone number assignment ID.
          #
          # @param campaign_id [String] 10DLC campaign ID.
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see Zavudev::Models::Number10dlc::Campaigns::PhoneNumberUnassignParams
          def unassign(assignment_id, params)
            parsed, options = Zavudev::Number10dlc::Campaigns::PhoneNumberUnassignParams.dump_request(params)
            campaign_id =
              parsed.delete(:campaign_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/10dlc/campaigns/%1$s/phone-numbers/%2$s", campaign_id, assignment_id],
              model: NilClass,
              options: options
            )
          end

          # @api private
          #
          # @param client [Zavudev::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
