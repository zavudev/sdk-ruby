# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::URLsTest < Zavudev::Test::ResourceTest
  def test_list_verified
    skip("Mock server tests are disabled")

    response = @zavudev.urls.list_verified

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::VerifiedURL
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        domain: String,
        status: Zavudev::VerifiedURL::Status,
        url: String,
        approval_type: Zavudev::VerifiedURL::ApprovalType | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_retrieve_details
    skip("Mock server tests are disabled")

    response = @zavudev.urls.retrieve_details("urlId")

    assert_pattern do
      response => Zavudev::Models::URLRetrieveDetailsResponse
    end

    assert_pattern do
      response => {
        url: Zavudev::VerifiedURL
      }
    end
  end

  def test_submit_for_verification_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.urls.submit_for_verification(url: "https://example.com/page")

    assert_pattern do
      response => Zavudev::Models::URLSubmitForVerificationResponse
    end

    assert_pattern do
      response => {
        url: Zavudev::VerifiedURL
      }
    end
  end
end
