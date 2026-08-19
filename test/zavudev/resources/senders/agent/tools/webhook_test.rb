# frozen_string_literal: true

require_relative "../../../../test_helper"

class Zavudev::Test::Resources::Senders::Agent::Tools::WebhookTest < Zavudev::Test::ResourceTest
  def test_rotate_secret_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.agent.tools.webhook.rotate_secret("toolId", sender_id: "senderId")

    assert_pattern do
      response => Zavudev::WebhookSecretResponse
    end

    assert_pattern do
      response => {
        secret: String
      }
    end
  end
end
