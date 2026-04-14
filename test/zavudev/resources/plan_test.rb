# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::PlanTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.plan.retrieve

    assert_pattern do
      response => Zavudev::Models::PlanRetrieveResponse
    end

    assert_pattern do
      response => {
        billing_interval: Zavudev::Models::PlanRetrieveResponse::BillingInterval,
        status: Zavudev::Models::PlanRetrieveResponse::Status,
        tier: Zavudev::Models::PlanRetrieveResponse::Tier,
        cancel_at_period_end: Zavudev::Internal::Type::Boolean | nil,
        current_period_end: Time | nil,
        current_period_start: Time | nil,
        limits: Zavudev::Models::PlanRetrieveResponse::Limits | nil
      }
    end
  end
end
