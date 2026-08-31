# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::AgentsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.agents.create(model: "model", name: "name", provider: :openai, system_prompt: "systemPrompt")

    assert_pattern do
      response => Zavudev::Models::AgentCreateResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.agents.retrieve("agentId")

    assert_pattern do
      response => Zavudev::Models::AgentRetrieveResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.agents.update("agentId")

    assert_pattern do
      response => Zavudev::Models::AgentUpdateResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.agents.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Senders::SendersAgent
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        enabled: Zavudev::Internal::Type::Boolean,
        model: String,
        name: String,
        provider: Zavudev::Senders::AgentProvider,
        sender_id: String,
        system_prompt: String,
        updated_at: Time,
        context_window_messages: Integer | nil,
        include_contact_metadata: Zavudev::Internal::Type::Boolean | nil,
        max_tokens: Integer | nil,
        sender_ids: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        stats: Zavudev::Senders::SendersAgent::Stats | nil,
        temperature: Float | nil,
        trigger_on_channels: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        trigger_on_message_types: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        voice: Zavudev::Senders::SendersAgent::Voice | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.agents.delete("agentId")

    assert_pattern do
      response => nil
    end
  end

  def test_list_voices
    skip("Mock server tests are disabled")

    response = @zavudev.agents.list_voices

    assert_pattern do
      response => Zavudev::Models::AgentListVoicesResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentListVoicesResponse::Item]),
        languages: ^(Zavudev::Internal::Type::ArrayOf[String]),
        total: Integer | nil
      }
    end
  end

  def test_test__required_params
    skip("Mock server tests are disabled")

    response = @zavudev.agents.test_("agentId", message: "Where is order ORD-12345?")

    assert_pattern do
      response => Zavudev::Models::AgentTestResponse
    end

    assert_pattern do
      response => {
        error: String | nil,
        input_tokens: Integer,
        knowledge_chunks_used: Integer,
        latency_ms: Integer,
        output_tokens: Integer,
        success: Zavudev::Internal::Type::Boolean,
        text: String | nil,
        warnings: ^(Zavudev::Internal::Type::ArrayOf[String]),
        executed_tool_calls: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentTestResponse::ExecutedToolCall]) | nil
      }
    end
  end
end
