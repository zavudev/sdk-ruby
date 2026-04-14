# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::SubAccounts::APIKeysTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.api_keys.create("id", name: "Production Key")

    assert_pattern do
      response => Zavudev::Models::SubAccounts::APIKeyCreateResponse
    end

    assert_pattern do
      response => {
        api_key: Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.api_keys.list("id")

    assert_pattern do
      response => Zavudev::Models::SubAccounts::APIKeyListResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::SubAccounts::APIKeyListResponse::Item])
      }
    end
  end

  def test_revoke_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.sub_accounts.api_keys.revoke("keyId", id: "id")

    assert_pattern do
      response => nil
    end
  end
end
