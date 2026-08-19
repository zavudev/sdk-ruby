# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::ConversationsTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.conversations.retrieve("conversationId")

    assert_pattern do
      response => Zavudev::Models::ConversationRetrieveResponse
    end

    assert_pattern do
      response => {
        conversation: Zavudev::Models::ConversationRetrieveResponse::Conversation
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.conversations.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Models::ConversationListResponse
    end

    assert_pattern do
      row => {
        id: String,
        channels: ^(Zavudev::Internal::Type::ArrayOf[String]),
        contact_identifier: String,
        created_at: Time,
        last_message: Zavudev::Models::ConversationListResponse::LastMessage,
        message_count: Integer,
        unread_count: Integer,
        updated_at: Time,
        contact_id: String | nil,
        email: String | nil,
        group: Zavudev::Models::ConversationListResponse::Group | nil,
        sender_id: String | nil,
        whatsapp: Zavudev::Models::ConversationListResponse::Whatsapp | nil
      }
    end
  end

  def test_list_messages
    skip("Mock server tests are disabled")

    response = @zavudev.conversations.list_messages("conversationId")

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
        conversation_id: String | nil,
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

  def test_mark_as_read
    skip("Mock server tests are disabled")

    response = @zavudev.conversations.mark_as_read("conversationId")

    assert_pattern do
      response => Zavudev::Models::ConversationMarkAsReadResponse
    end

    assert_pattern do
      response => {
        conversation: Zavudev::Models::ConversationMarkAsReadResponse::Conversation
      }
    end
  end
end
