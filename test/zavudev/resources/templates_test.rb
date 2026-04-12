# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::TemplatesTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.templates.create(
        body: "Hi {{1}}, your order {{2}} has been confirmed and will ship within 24 hours.",
        language: "en",
        name: "order_confirmation"
      )

    assert_pattern do
      response => Zavudev::Template
    end

    assert_pattern do
      response => {
        id: String,
        body: String,
        category: Zavudev::WhatsappCategory,
        language: String,
        name: String,
        add_security_recommendation: Zavudev::Internal::Type::Boolean | nil,
        buttons: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Template::Button]) | nil,
        code_expiration_minutes: Integer | nil,
        created_at: Time | nil,
        footer: String | nil,
        header_content: String | nil,
        header_type: String | nil,
        instagram_body: String | nil,
        sms_body: String | nil,
        status: Zavudev::Template::Status | nil,
        telegram_body: String | nil,
        updated_at: Time | nil,
        variables: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        whatsapp: Zavudev::Template::Whatsapp | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.templates.retrieve("templateId")

    assert_pattern do
      response => Zavudev::Template
    end

    assert_pattern do
      response => {
        id: String,
        body: String,
        category: Zavudev::WhatsappCategory,
        language: String,
        name: String,
        add_security_recommendation: Zavudev::Internal::Type::Boolean | nil,
        buttons: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Template::Button]) | nil,
        code_expiration_minutes: Integer | nil,
        created_at: Time | nil,
        footer: String | nil,
        header_content: String | nil,
        header_type: String | nil,
        instagram_body: String | nil,
        sms_body: String | nil,
        status: Zavudev::Template::Status | nil,
        telegram_body: String | nil,
        updated_at: Time | nil,
        variables: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        whatsapp: Zavudev::Template::Whatsapp | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.templates.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Template
    end

    assert_pattern do
      row => {
        id: String,
        body: String,
        category: Zavudev::WhatsappCategory,
        language: String,
        name: String,
        add_security_recommendation: Zavudev::Internal::Type::Boolean | nil,
        buttons: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Template::Button]) | nil,
        code_expiration_minutes: Integer | nil,
        created_at: Time | nil,
        footer: String | nil,
        header_content: String | nil,
        header_type: String | nil,
        instagram_body: String | nil,
        sms_body: String | nil,
        status: Zavudev::Template::Status | nil,
        telegram_body: String | nil,
        updated_at: Time | nil,
        variables: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        whatsapp: Zavudev::Template::Whatsapp | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.templates.delete("templateId")

    assert_pattern do
      response => nil
    end
  end

  def test_submit_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.templates.submit("templateId", sender_id: "sender_abc123")

    assert_pattern do
      response => Zavudev::Template
    end

    assert_pattern do
      response => {
        id: String,
        body: String,
        category: Zavudev::WhatsappCategory,
        language: String,
        name: String,
        add_security_recommendation: Zavudev::Internal::Type::Boolean | nil,
        buttons: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Template::Button]) | nil,
        code_expiration_minutes: Integer | nil,
        created_at: Time | nil,
        footer: String | nil,
        header_content: String | nil,
        header_type: String | nil,
        instagram_body: String | nil,
        sms_body: String | nil,
        status: Zavudev::Template::Status | nil,
        telegram_body: String | nil,
        updated_at: Time | nil,
        variables: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        whatsapp: Zavudev::Template::Whatsapp | nil
      }
    end
  end
end
