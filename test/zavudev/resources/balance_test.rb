# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::BalanceTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.balance.retrieve

    assert_pattern do
      response => Zavudev::Models::BalanceRetrieveResponse
    end

    assert_pattern do
      response => {
        balance: Integer,
        currency: String,
        credit_limit: Integer | nil,
        is_sub_account: Zavudev::Internal::Type::Boolean | nil,
        total_spent: Integer | nil
      }
    end
  end
end
