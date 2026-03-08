# frozen_string_literal: true

require_relative "../../../test_helper"

class Zavudev::Test::Resources::Senders::Agent::ExecutionsTest < Zavudev::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.executions.list("senderId")

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Senders::AgentExecution
    end

    assert_pattern do
      row => {
        id: String,
        agent_id: String,
        cost: Float,
        created_at: Time,
        input_tokens: Integer,
        latency_ms: Integer,
        output_tokens: Integer,
        status: Zavudev::Senders::AgentExecutionStatus,
        error_message: String | nil,
        inbound_message_id: String | nil,
        response_message_id: String | nil,
        response_text: String | nil
      }
    end
  end
end
