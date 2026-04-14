# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::SubAccountsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.create(name: "Client ABC")

    assert_pattern do
      response => Zavudev::Models::SubAccountCreateResponse
    end

    assert_pattern do
      response => {
        sub_account: Zavudev::SubAccount
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.retrieve("id")

    assert_pattern do
      response => Zavudev::Models::SubAccountRetrieveResponse
    end

    assert_pattern do
      response => {
        sub_account: Zavudev::SubAccount
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.update("id")

    assert_pattern do
      response => Zavudev::Models::SubAccountUpdateResponse
    end

    assert_pattern do
      response => {
        sub_account: Zavudev::SubAccount
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::SubAccount
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        name: String,
        status: Zavudev::SubAccount::Status,
        total_spent: Integer,
        api_key: String | nil,
        credit_limit: Integer | nil,
        external_id: String | nil,
        metadata: ^(Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown]) | nil
      }
    end
  end

  def test_deactivate
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.deactivate("id")

    assert_pattern do
      response => Zavudev::Models::SubAccountDeactivateResponse
    end

    assert_pattern do
      response => {
        keys_revoked: Integer,
        message: String
      }
    end
  end

  def test_get_balance
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.get_balance("id")

    assert_pattern do
      response => Zavudev::Models::SubAccountGetBalanceResponse
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
