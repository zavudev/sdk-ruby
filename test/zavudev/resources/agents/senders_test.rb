# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Agents::SendersTest < Zavudev::Test::ResourceTest
  def test_connect_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.agents.senders.connect("agentId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::Models::Agents::SenderConnectResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_disconnect_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.agents.senders.disconnect("senderId", agent_id: "agentId")

    assert_pattern do
      response => nil
    end
  end
end
