# frozen_string_literal: true

require_relative "../../../test_helper"

class Zavudev::Test::Resources::Number10dlc::Campaigns::PhoneNumbersTest < Zavudev::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.phone_numbers.list("campaignId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::Campaigns::PhoneNumberListResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment]),
        next_cursor: String | nil
      }
    end
  end

  def test_assign_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.number_10dlc.campaigns.phone_numbers.assign("campaignId", phone_number_id: "pn_abc123")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::Campaigns::PhoneNumberAssignResponse
    end

    assert_pattern do
      response => {
        assignment: Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment
      }
    end
  end

  def test_unassign_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.number_10dlc.campaigns.phone_numbers.unassign("assignmentId", campaign_id: "campaignId")

    assert_pattern do
      response => nil
    end
  end
end
