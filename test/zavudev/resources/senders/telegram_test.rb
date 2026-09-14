# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Senders::TelegramTest < Zavudev::Test::ResourceTest
  def test_connect_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.senders.telegram.connect("senderId", bot_token: "botToken")

    assert_pattern do
      response => Zavudev::Models::Senders::TelegramConnectResponse
    end

    assert_pattern do
      response => {
        telegram: Zavudev::Models::Senders::TelegramConnectResponse::Telegram
      }
    end
  end

  def test_disconnect
    skip("Mock server tests are disabled")

    response = @zavudev.senders.telegram.disconnect("senderId")

    assert_pattern do
      response => nil
    end
  end
end
