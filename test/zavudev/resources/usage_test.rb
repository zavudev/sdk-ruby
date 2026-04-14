# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::UsageTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.usage.retrieve

    assert_pattern do
      response => Zavudev::Models::UsageRetrieveResponse
    end

    assert_pattern do
      response => {
        emails_sent: Integer,
        limits: Zavudev::Models::UsageRetrieveResponse::Limits,
        messages_a2_p: Integer,
        month_key: String,
        tier: Zavudev::Models::UsageRetrieveResponse::Tier
      }
    end
  end
end
