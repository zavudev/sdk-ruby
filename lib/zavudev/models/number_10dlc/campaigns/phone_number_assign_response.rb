# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        # @see Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers#assign
        class PhoneNumberAssignResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute assignment
          #
          #   @return [Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment]
          required :assignment, -> { Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment }

          # @!method initialize(assignment:)
          #   @param assignment [Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment]
        end
      end
    end
  end
end
