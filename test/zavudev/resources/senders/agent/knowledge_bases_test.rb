# frozen_string_literal: true

require_relative "../../../test_helper"

class Zavudev::Test::Resources::Senders::Agent::KnowledgeBasesTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.knowledge_bases.create("senderId", name: "Product FAQ")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::KnowledgeBaseCreateResponse
    end

    assert_pattern do
      response => {
        knowledge_base: Zavudev::Senders::Agent::AgentKnowledgeBase
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.knowledge_bases.retrieve("kbId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::KnowledgeBaseRetrieveResponse
    end

    assert_pattern do
      response => {
        knowledge_base: Zavudev::Senders::Agent::AgentKnowledgeBase
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.knowledge_bases.update("kbId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::KnowledgeBaseUpdateResponse
    end

    assert_pattern do
      response => {
        knowledge_base: Zavudev::Senders::Agent::AgentKnowledgeBase
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.knowledge_bases.list("senderId")

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Senders::Agent::AgentKnowledgeBase
    end

    assert_pattern do
      row => {
        id: String,
        agent_id: String,
        created_at: Time,
        document_count: Integer,
        name: String,
        total_chunks: Integer,
        updated_at: Time,
        description: String | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.knowledge_bases.delete("kbId", sender_id: "senderId")

    assert_pattern do
      response => nil
    end
  end
end
