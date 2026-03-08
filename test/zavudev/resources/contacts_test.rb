# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::ContactsTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.retrieve("contactId")

    assert_pattern do
      response => Zavudev::Contact
    end

    assert_pattern do
      response => {
        id: String,
        available_channels: ^(Zavudev::Internal::Type::ArrayOf[String]),
        created_at: Time,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]),
        verified: Zavudev::Internal::Type::Boolean,
        channels: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Contact::Channel]) | nil,
        country_code: String | nil,
        default_channel: Zavudev::Contact::DefaultChannel | nil,
        display_name: String | nil,
        phone_number: String | nil,
        primary_email: String | nil,
        primary_phone: String | nil,
        profile_name: String | nil,
        suggested_merge_with: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.update("contactId")

    assert_pattern do
      response => Zavudev::Contact
    end

    assert_pattern do
      response => {
        id: String,
        available_channels: ^(Zavudev::Internal::Type::ArrayOf[String]),
        created_at: Time,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]),
        verified: Zavudev::Internal::Type::Boolean,
        channels: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Contact::Channel]) | nil,
        country_code: String | nil,
        default_channel: Zavudev::Contact::DefaultChannel | nil,
        display_name: String | nil,
        phone_number: String | nil,
        primary_email: String | nil,
        primary_phone: String | nil,
        profile_name: String | nil,
        suggested_merge_with: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Contact
    end

    assert_pattern do
      row => {
        id: String,
        available_channels: ^(Zavudev::Internal::Type::ArrayOf[String]),
        created_at: Time,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]),
        verified: Zavudev::Internal::Type::Boolean,
        channels: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Contact::Channel]) | nil,
        country_code: String | nil,
        default_channel: Zavudev::Contact::DefaultChannel | nil,
        display_name: String | nil,
        phone_number: String | nil,
        primary_email: String | nil,
        primary_phone: String | nil,
        profile_name: String | nil,
        suggested_merge_with: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_retrieve_by_phone
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.retrieve_by_phone("phoneNumber")

    assert_pattern do
      response => Zavudev::Contact
    end

    assert_pattern do
      response => {
        id: String,
        available_channels: ^(Zavudev::Internal::Type::ArrayOf[String]),
        created_at: Time,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]),
        verified: Zavudev::Internal::Type::Boolean,
        channels: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Contact::Channel]) | nil,
        country_code: String | nil,
        default_channel: Zavudev::Contact::DefaultChannel | nil,
        display_name: String | nil,
        phone_number: String | nil,
        primary_email: String | nil,
        primary_phone: String | nil,
        profile_name: String | nil,
        suggested_merge_with: String | nil,
        updated_at: Time | nil
      }
    end
  end
end
