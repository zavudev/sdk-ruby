# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Functions::SecretsTest < Zavudev::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.functions.secrets.list("functionId")

    assert_pattern do
      response => Zavudev::Models::Functions::SecretListResponse
    end

    assert_pattern do
      response => {
        secrets: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Functions::SecretListResponse::Secret])
      }
    end
  end

  def test_set_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.functions.secrets.set("key", function_id: "functionId", value: "value")

    assert_pattern do
      response => Zavudev::Internal::Type::Unknown
    end
  end

  def test_unset_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.functions.secrets.unset("key", function_id: "functionId")

    assert_pattern do
      response => nil
    end
  end
end
