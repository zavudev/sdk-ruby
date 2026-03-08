# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::MessagesTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.messages.retrieve("messageId")

    assert_pattern do
      response => Zavudev::MessageResponse
    end

    assert_pattern do
      response => {
        message: Zavudev::Message
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.messages.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Message
    end

    assert_pattern do
      row => {
        id: String,
        channel: Zavudev::Channel,
        created_at: Time,
        message_type: Zavudev::MessageType,
        status: Zavudev::MessageStatus,
        to: String,
        content: Zavudev::MessageContent | nil,
        cost: Float | nil,
        cost_provider: Float | nil,
        cost_total: Float | nil,
        error_code: String | nil,
        error_message: String | nil,
        from: String | nil,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]) | nil,
        provider_message_id: String | nil,
        sender_id: String | nil,
        text: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_react_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.messages.react("messageId", emoji: "👍")

    assert_pattern do
      response => Zavudev::MessageResponse
    end

    assert_pattern do
      response => {
        message: Zavudev::Message
      }
    end
  end

  def test_send__required_params
    skip("Mock server tests are disabled")

    response = @zavudev.messages.send_(to: "+56912345678")

    assert_pattern do
      response => Zavudev::MessageResponse
    end

    assert_pattern do
      response => {
        message: Zavudev::Message
      }
    end
  end
end
