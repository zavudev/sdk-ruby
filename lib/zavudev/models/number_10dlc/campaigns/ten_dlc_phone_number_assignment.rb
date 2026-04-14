# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        class TenDlcPhoneNumberAssignment < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute campaign_id
          #
          #   @return [String]
          required :campaign_id, String, api_name: :campaignId

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute phone_number_id
          #
          #   @return [String]
          required :phone_number_id, String, api_name: :phoneNumberId

          # @!attribute status
          #   Assignment status.
          #
          #   @return [Symbol, Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status]
          required :status, enum: -> { Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute assigned_at
          #
          #   @return [Time, nil]
          optional :assigned_at, Time, api_name: :assignedAt, nil?: true

          # @!attribute failure_reason
          #
          #   @return [String, nil]
          optional :failure_reason, String, api_name: :failureReason, nil?: true

          # @!method initialize(id:, campaign_id:, created_at:, phone_number_id:, status:, updated_at:, assigned_at: nil, failure_reason: nil)
          #   @param id [String]
          #
          #   @param campaign_id [String]
          #
          #   @param created_at [Time]
          #
          #   @param phone_number_id [String]
          #
          #   @param status [Symbol, Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status] Assignment status.
          #
          #   @param updated_at [Time]
          #
          #   @param assigned_at [Time, nil]
          #
          #   @param failure_reason [String, nil]

          # Assignment status.
          #
          # @see Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment#status
          module Status
            extend Zavudev::Internal::Type::Enum

            PENDING = :pending
            ACTIVE = :active
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
