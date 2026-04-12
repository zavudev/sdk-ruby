# frozen_string_literal: true

require_relative "../../../test_helper"

class Zavudev::Test::Resources::Senders::Agent::ToolsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.tools.create(
        "senderId",
        description: "Get the status of a customer order",
        name: "get_order_status",
        parameters: {properties: {order_id: {}}, required: ["order_id"], type: :object},
        webhook_url: "https://api.example.com/webhooks/order-status"
      )

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::ToolCreateResponse
    end

    assert_pattern do
      response => {
        tool: Zavudev::Senders::Agent::AgentTool
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.tools.retrieve("toolId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::ToolRetrieveResponse
    end

    assert_pattern do
      response => {
        tool: Zavudev::Senders::Agent::AgentTool
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.tools.update("toolId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::ToolUpdateResponse
    end

    assert_pattern do
      response => {
        tool: Zavudev::Senders::Agent::AgentTool
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.tools.list("senderId")

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Senders::Agent::AgentTool
    end

    assert_pattern do
      row => {
        id: String,
        agent_id: String,
        created_at: Time,
        description: String,
        enabled: Zavudev::Internal::Type::Boolean,
        name: String,
        parameters: Zavudev::Senders::Agent::ToolParameters,
        updated_at: Time,
        webhook_url: String
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.tools.delete("toolId", sender_id: "senderId")

    assert_pattern do
      response => nil
    end
  end

  def test_test__required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.tools.test_("toolId", sender_id: "senderId", test_params: {order_id: "bar"})

    assert_pattern do
      response => Zavudev::Models::Senders::Agent::ToolTestResponse
    end

    assert_pattern do
      response => {
        scheduled: Zavudev::Internal::Type::Boolean
      }
    end
  end
end
