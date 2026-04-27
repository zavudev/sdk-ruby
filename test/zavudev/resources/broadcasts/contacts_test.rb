# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Broadcasts::ContactsTest < Zavudev::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.contacts.list("broadcastId")

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::BroadcastContact
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        recipient: String,
        recipient_type: Zavudev::BroadcastContact::RecipientType,
        status: Zavudev::BroadcastContactStatus,
        cost: Float | nil,
        error_code: String | nil,
        error_message: String | nil,
        message_id: String | nil,
        processed_at: Time | nil,
        template_button_variables: ^(Zavudev::Internal::Type::HashOf[String]) | nil,
        template_variables: ^(Zavudev::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_add_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.broadcasts.contacts.add(
        "broadcastId",
        contacts: [{recipient: "+14155551234"}, {recipient: "+14155555678"}]
      )

    assert_pattern do
      response => Zavudev::Models::Broadcasts::ContactAddResponse
    end

    assert_pattern do
      response => {
        added: Integer,
        duplicates: Integer,
        invalid: Integer,
        errors: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Broadcasts::ContactAddResponse::Error]) | nil
      }
    end
  end

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.contacts.remove("contactId", broadcast_id: "broadcastId")

    assert_pattern do
      response => nil
    end
  end
end
