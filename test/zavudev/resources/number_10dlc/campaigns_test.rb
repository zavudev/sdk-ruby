# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Number10dlc::CampaignsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.number_10dlc.campaigns.create(
        affiliate_marketing: false,
        age_gated: false,
        brand_id: "brand_abc123",
        description: "Send order status updates and shipping notifications to customers who opted in.",
        direct_lending: false,
        embedded_link: true,
        embedded_phone: false,
        name: "Order Notifications",
        number_pooling: false,
        sample_messages: [
          "Hi {{name}}, your order \#{{order_id}} has shipped! Track it at {{url}}",
          "Your order \#{{order_id}} has been delivered. Thank you for your purchase!"
        ],
        subscriber_help: true,
        subscriber_opt_in: true,
        subscriber_opt_out: true,
        use_case: "ACCOUNT_NOTIFICATION"
      )

    assert_pattern do
      response => Zavudev::Models::Number10dlc::CampaignCreateResponse
    end

    assert_pattern do
      response => {
        campaign: Zavudev::Number10dlc::TenDlcCampaign
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.retrieve("campaignId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::CampaignRetrieveResponse
    end

    assert_pattern do
      response => {
        campaign: Zavudev::Number10dlc::TenDlcCampaign
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.update("campaignId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::CampaignUpdateResponse
    end

    assert_pattern do
      response => {
        campaign: Zavudev::Number10dlc::TenDlcCampaign
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Number10dlc::TenDlcCampaign
    end

    assert_pattern do
      row => {
        id: String,
        affiliate_marketing: Zavudev::Internal::Type::Boolean,
        age_gated: Zavudev::Internal::Type::Boolean,
        brand_id: String,
        created_at: Time,
        description: String,
        direct_lending: Zavudev::Internal::Type::Boolean,
        embedded_link: Zavudev::Internal::Type::Boolean,
        embedded_phone: Zavudev::Internal::Type::Boolean,
        name: String,
        number_pooling: Zavudev::Internal::Type::Boolean,
        sample_messages: ^(Zavudev::Internal::Type::ArrayOf[String]),
        status: Zavudev::Number10dlc::TenDlcCampaign::Status,
        subscriber_help: Zavudev::Internal::Type::Boolean,
        subscriber_opt_in: Zavudev::Internal::Type::Boolean,
        subscriber_opt_out: Zavudev::Internal::Type::Boolean,
        updated_at: Time,
        use_case: String,
        approved_at: Time | nil,
        daily_limit: Integer | nil,
        failure_reason: String | nil,
        help_message: String | nil,
        message_flow: String | nil,
        monthly_fee_cents: Integer | nil,
        opt_in_keywords: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        opt_out_keywords: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        registration_cost_cents: Integer | nil,
        submitted_at: Time | nil,
        sub_use_cases: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.delete("campaignId")

    assert_pattern do
      response => nil
    end
  end

  def test_submit
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.submit("campaignId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::CampaignSubmitResponse
    end

    assert_pattern do
      response => {
        campaign: Zavudev::Number10dlc::TenDlcCampaign
      }
    end
  end

  def test_sync_status
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.campaigns.sync_status("campaignId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::CampaignSyncStatusResponse
    end

    assert_pattern do
      response => {
        campaign: Zavudev::Number10dlc::TenDlcCampaign
      }
    end
  end
end
