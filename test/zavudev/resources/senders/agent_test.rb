# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Senders::AgentTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.senders.agent.create(
        "senderId",
        model: "gpt-4o-mini",
        name: "Customer Support",
        provider: :openai,
        system_prompt: "You are a helpful customer support agent. Be friendly and concise."
      )

    assert_pattern do
      response => Zavudev::Senders::AgentResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.retrieve("senderId")

    assert_pattern do
      response => Zavudev::Senders::AgentResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.update("senderId")

    assert_pattern do
      response => Zavudev::Senders::AgentResponse
    end

    assert_pattern do
      response => {
        agent: Zavudev::Senders::SendersAgent
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.delete("senderId")

    assert_pattern do
      response => nil
    end
  end

  def test_stats
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.stats("senderId")

    assert_pattern do
      response => Zavudev::Senders::AgentStats
    end

    assert_pattern do
      response => {
        error_count: Integer,
        success_count: Integer,
        total_cost: Float,
        total_invocations: Integer,
        total_tokens_used: Integer,
        avg_latency_ms: Float | nil
      }
    end
  end
end
