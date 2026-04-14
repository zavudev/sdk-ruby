# typed: strong

module Zavudev
  module Resources
    class Number10dlc
      class Campaigns
        class PhoneNumbers
          # List phone numbers assigned to a 10DLC campaign.
          sig do
            params(
              campaign_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Models::Number10dlc::Campaigns::PhoneNumberListResponse
            )
          end
          def list(
            # 10DLC campaign ID.
            campaign_id,
            request_options: {}
          )
          end

          # Assign a US phone number to an approved 10DLC campaign. The campaign must be in
          # approved status.
          sig do
            params(
              campaign_id: String,
              phone_number_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Models::Number10dlc::Campaigns::PhoneNumberAssignResponse
            )
          end
          def assign(
            # 10DLC campaign ID.
            campaign_id,
            # ID of the phone number to assign.
            phone_number_id:,
            request_options: {}
          )
          end

          # Remove a phone number assignment from a 10DLC campaign.
          sig do
            params(
              assignment_id: String,
              campaign_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).void
          end
          def unassign(
            # Phone number assignment ID.
            assignment_id,
            # 10DLC campaign ID.
            campaign_id:,
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
end
