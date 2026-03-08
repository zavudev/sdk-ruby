# frozen_string_literal: true

require_relative "../../../test_helper"

class Zavudev::Test::Resources::Senders::Agent::FlowsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.flows.create(
        "senderId",
        name: "Lead Capture",
        steps: [
          {id: "welcome", config: {text: "bar"}, type: :message},
          {id: "ask_name", config: {variable: "bar", prompt: "bar"}, type: :collect}
        ],
        trigger: {type: :keyword}
      )

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::FlowCreateResponse
    end

    assert_pattern do
      response => {
        flow: Zavudev::Senders::Agent::AgentFlow
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.flows.retrieve("flowId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::FlowRetrieveResponse
    end

    assert_pattern do
      response => {
        flow: Zavudev::Senders::Agent::AgentFlow
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.flows.update("flowId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::FlowUpdateResponse
    end

    assert_pattern do
      response => {
        flow: Zavudev::Senders::Agent::AgentFlow
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.flows.list("senderId")

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Senders::Agent::AgentFlow
    end

    assert_pattern do
      row => {
        id: String,
        agent_id: String,
        created_at: Time,
        enabled: Zavudev::Internal::Type::Boolean,
        name: String,
        priority: Integer,
        steps: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Senders::Agent::AgentFlow::Step]),
        trigger: Zavudev::Senders::Agent::AgentFlow::Trigger,
        updated_at: Time,
        description: String | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.flows.delete("flowId", sender_id: "senderId")

    assert_pattern do
      response => nil
    end
  end

  def test_duplicate_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.flows.duplicate("flowId", sender_id: "senderId", new_name: "Lead Capture (Copy)")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::FlowDuplicateResponse
    end

    assert_pattern do
      response => {
        flow: Zavudev::Senders::Agent::AgentFlow
      }
    end
  end
end
