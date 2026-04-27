# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        # @see Zavudev::Resources::Number10dlc::Campaigns::PhoneNumbers#list
        class PhoneNumberListResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute items
          #
          #   @return [Array<Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment>]
          required :items,
                   -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment] }

          # @!attribute next_cursor
          #
          #   @return [String, nil]
          optional :next_cursor, String, api_name: :nextCursor, nil?: true

          # @!method initialize(items:, next_cursor: nil)
          #   @param items [Array<Zavudev::Models::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment>]
          #   @param next_cursor [String, nil]
        end
      end
    end
  end
end
