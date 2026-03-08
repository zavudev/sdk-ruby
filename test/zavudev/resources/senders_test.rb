# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::SendersTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.create(name: "name", phone_number: "phoneNumber")

    assert_pattern do
      response => Zavudev::Sender
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        phone_number: String,
        created_at: Time | nil,
        email_receiving_enabled: Zavudev::Internal::Type::Boolean | nil,
        is_default: Zavudev::Internal::Type::Boolean | nil,
        updated_at: Time | nil,
        webhook: Zavudev::SenderWebhook | nil,
        whatsapp: Zavudev::Sender::Whatsapp | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.senders.retrieve("senderId")

    assert_pattern do
      response => Zavudev::Sender
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        phone_number: String,
        created_at: Time | nil,
        email_receiving_enabled: Zavudev::Internal::Type::Boolean | nil,
        is_default: Zavudev::Internal::Type::Boolean | nil,
        updated_at: Time | nil,
        webhook: Zavudev::SenderWebhook | nil,
        whatsapp: Zavudev::Sender::Whatsapp | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.senders.update("senderId")

    assert_pattern do
      response => Zavudev::Sender
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        phone_number: String,
        created_at: Time | nil,
        email_receiving_enabled: Zavudev::Internal::Type::Boolean | nil,
        is_default: Zavudev::Internal::Type::Boolean | nil,
        updated_at: Time | nil,
        webhook: Zavudev::SenderWebhook | nil,
        whatsapp: Zavudev::Sender::Whatsapp | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.senders.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Sender
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        phone_number: String,
        created_at: Time | nil,
        email_receiving_enabled: Zavudev::Internal::Type::Boolean | nil,
        is_default: Zavudev::Internal::Type::Boolean | nil,
        updated_at: Time | nil,
        webhook: Zavudev::SenderWebhook | nil,
        whatsapp: Zavudev::Sender::Whatsapp | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.senders.delete("senderId")

    assert_pattern do
      response => nil
    end
  end

  def test_get_profile
    skip("Mock server tests are disabled")

    response = @zavudev.senders.get_profile("senderId")

    assert_pattern do
      response => Zavudev::WhatsappBusinessProfileResponse
    end

    assert_pattern do
      response => {
        profile: Zavudev::WhatsappBusinessProfile
      }
    end
  end

  def test_regenerate_webhook_secret
    skip("Mock server tests are disabled")

    response = @zavudev.senders.regenerate_webhook_secret("senderId")

    assert_pattern do
      response => Zavudev::WebhookSecretResponse
    end

    assert_pattern do
      response => {
        secret: String
      }
    end
  end

  def test_update_profile
    skip("Mock server tests are disabled")

    response = @zavudev.senders.update_profile("senderId")

    assert_pattern do
      response => Zavudev::Models::SenderUpdateProfileResponse
    end

    assert_pattern do
      response => {
        profile: Zavudev::WhatsappBusinessProfile,
        success: Zavudev::Internal::Type::Boolean
      }
    end
  end

  def test_upload_profile_picture_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.upload_profile_picture(
        "senderId",
        image_url: "https://example.com/profile.jpg",
        mime_type: :"image/jpeg"
      )

    assert_pattern do
      response => Zavudev::Models::SenderUploadProfilePictureResponse
    end

    assert_pattern do
      response => {
        profile: Zavudev::WhatsappBusinessProfile,
        success: Zavudev::Internal::Type::Boolean
      }
    end
  end
end
