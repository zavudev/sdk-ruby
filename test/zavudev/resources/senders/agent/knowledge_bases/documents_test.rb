# frozen_string_literal: true

require_relative "../../../../test_helper"

class Zavudev::Test::Resources::Senders::Agent::KnowledgeBases::DocumentsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.knowledge_bases.documents.create(
        "kbId",
        sender_id: "senderId",
        content: "Our return policy allows returns within 30 days of purchase...",
        title: "Return Policy"
      )

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentCreateResponse
    end

    assert_pattern do
      response => {
        document: Zavudev::Senders::Agent::AgentDocument
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.knowledge_bases.documents.list("kbId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Senders::Agent::AgentDocument
    end

    assert_pattern do
      row => {
        id: String,
        chunk_count: Integer,
        content_length: Integer,
        created_at: Time,
        is_processed: Zavudev::Internal::Type::Boolean,
        knowledge_base_id: String,
        title: String,
        updated_at: Time
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.knowledge_bases.documents.delete("docId", sender_id: "senderId", kb_id: "kbId")

    assert_pattern do
      response => nil
    end
  end
end
